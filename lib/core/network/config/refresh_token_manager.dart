import 'dart:async';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

import 'package:quickslot/core/network/client/dio_client.dart';
import 'package:quickslot/core/network/config/status_codes.dart';
import 'package:quickslot/core/network/utils/api_constants.dart';
import 'package:quickslot/features/login/controller/login_controller.dart';
import 'package:quickslot/store/local_storage.dart';

/// Manages token refresh operations and request retries.
///
/// This singleton class handles authentication token refreshing when requests
/// fail with unauthorized errors, and manages retrying those requests after
/// a successful token refresh.
class RefreshTokenManager {
  static final Logger _log = Logger('RefreshTokenManager');
  static final RefreshTokenManager _instance = RefreshTokenManager._internal();

  /// Factory constructor that returns the singleton instance
  factory RefreshTokenManager() => _instance;

  RefreshTokenManager._internal();

  /// Flag indicating if a token refresh is currently in progress
  bool _isRefreshing = false;

  /// Completer for the current refresh operation
  Completer<void>? refreshCompleter;

  /// Queue of requests waiting to be retried after token refresh
  final List<QueuedRequest> _requestQueue = [];

  /// Dio client for making HTTP requests
  final DioClient _dioClient = DioClient();

  /// Handles a request with automatic token refresh if needed.
  ///
  /// If the request fails with an unauthorized error, this method will
  /// refresh the token and retry the request.
  ///
  /// Parameters:
  /// - [request]: The original request to be executed
  ///
  /// Returns:
  /// - A [Response] object from the original or retried request
  Future<Response> handleRequest(Future<Response> request) async {
    try {
      final response = await request;
      if (isUnauthorizedResponse(response)) {
        _log.info('Received unauthorized response, refreshing token');
        await handleRefreshIfNeeded(response);
        // Retry the request after refreshing
        return await request;
      }
      return response;
    } catch (e) {
      if (e is DioException && isUnauthorizedResponse(e.response)) {
        _log.info('Caught unauthorized exception, refreshing token');
        await handleRefreshIfNeeded(e.response!);
        // Retry the request after refreshing
        return await retryRequest(e.requestOptions);
      }
      _log.warning('Request failed with error', e);
      rethrow;
    }
  }

  /// Checks if a response indicates an unauthorized status
  bool isUnauthorizedResponse(Response? response) {
    return response != null &&
        (response.statusCode == HttpStatusCodes.UNAUTHORIZED ||
            response.statusCode ==
                HttpStatusCodes.PROXY_AUTHENTICATION_REQUIRED);
  }

  /// Refreshes the authentication token if needed.
  ///
  /// This method ensures that only one refresh operation happens at a time.
  /// If a refresh is already in progress, it waits for that operation to complete.
  ///
  /// Parameters:
  /// - [response]: The response that triggered the refresh
  Future<void> handleRefreshIfNeeded(Response response) async {
    if (!isUnauthorizedResponse(response)) return;

    if (!_isRefreshing) {
      _isRefreshing = true;
      refreshCompleter = Completer<void>();

      try {
        _log.info('Starting token refresh');
        await refreshToken();
        _log.info('Token refresh completed successfully');
        refreshCompleter?.complete();
      } catch (e) {
        _log.severe('Token refresh failed', e);
        refreshCompleter?.completeError(e);
        throw 'Failed to refresh authentication token: $e';
      } finally {
        _isRefreshing = false;
        processQueuedRequests();
        refreshCompleter = null;
      }
    } else {
      _log.info('Waiting for ongoing token refresh to complete');
      try {
        await refreshCompleter?.future;
      } catch (e) {
        _log.warning('Waiting for token refresh failed', e);
        rethrow;
      }
    }
  }

  /// Performs the actual token refresh operation.
  ///
  /// This method attempts to re-authenticate the user using stored credentials.
  Future<void> refreshToken() async {
    if (!await isUserLoggedIn()) {
      throw ApiConstants.SESSION_EXPIRED;
    }

    try {
      final loginController = LoginController();
      await loginController.invokeRelogin();
    } catch (e) {
      _log.severe('Failed to refresh token', e);
      throw 'Authentication failed during token refresh';
    }
  }

  /// Checks if the user is logged in with valid credentials
  Future<bool> isUserLoggedIn() async {
    final isLoggedIn = await LocalStorage.getLoggedInUser() == true;
    final userName = await LocalStorage.getUserName();
    final password = await LocalStorage.getPassword();

    return isLoggedIn &&
        userName != null &&
        userName.isNotEmpty &&
        password != null &&
        password.isNotEmpty;
  }

  /// Retries a request with the original request options.
  ///
  /// Parameters:
  /// - [requestOptions]: The original request options
  ///
  /// Returns:
  /// - A [Response] object from the retried request
  Future<Response> retryRequest(RequestOptions requestOptions) async {
    try {
      _log.info('Retrying request to: ${requestOptions.path}');
      final options = Options(
        method: requestOptions.method,
        headers: requestOptions.headers,
        responseType: requestOptions.responseType,
        contentType: requestOptions.contentType,
        validateStatus: requestOptions.validateStatus,
      );

      final response = await _dioClient.dio.request(
        requestOptions.path,
        options: options,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
      );

      return response;
    } catch (e) {
      _log.warning('Request retry failed', e);
      rethrow;
    }
  }

  /// Processes all queued requests after a token refresh.
  void processQueuedRequests() async {
    if (_requestQueue.isEmpty) return;

    _log.info('Processing ${_requestQueue.length} queued requests');
    final requests = List<QueuedRequest>.from(_requestQueue);
    _requestQueue.clear();

    for (final queuedRequest in requests) {
      try {
        final response = await retryRequest(queuedRequest.requestOptions);
        queuedRequest.completer.complete(response);
      } catch (e) {
        _log.warning('Failed to process queued request', e);
        queuedRequest.completer.completeError(e);
      }
    }
  }

  /// Adds a request to the queue for later processing.
  ///
  /// Parameters:
  /// - [request]: The original request
  /// - [requestOptions]: The request options
  ///
  /// Returns:
  /// - A [Future<Response>] that will complete when the request is processed
  Future<Response> addRequestToQueue(RequestOptions requestOptions) {
    _log.info('Adding request to queue: ${requestOptions.path}');
    final completer = Completer<Response>();
    _requestQueue.add(QueuedRequest(completer, requestOptions));
    return completer.future;
  }
}

/// Private class representing a queued request waiting to be retried.
class QueuedRequest {
  /// Completer that will be resolved when the request is retried
  final Completer<Response> completer;

  /// The original request options
  final RequestOptions requestOptions;

  QueuedRequest(this.completer, this.requestOptions);
}
