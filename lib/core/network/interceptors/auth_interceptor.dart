import 'package:quickslot/core/network/utils/alert_diaolge_utils.dart';
import 'package:quickslot/generated/l10n.dart' as l;
import 'package:quickslot/language/controller/language_controller.dart';
import 'package:quickslot/routes/navigation_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import 'package:quickslot/core/network/utils/api_constants.dart';
import 'package:quickslot/store/local_storage.dart';
import 'package:nb_utils/nb_utils.dart';

/// Interceptor for handling authentication headers and session management.
///
/// This interceptor:
/// 1. Adds authentication headers to outgoing requests
/// 2. Updates session storage from response headers
/// 3. Handles cookie management for non-web platforms
class AuthInterceptor extends Interceptor {
  static final _log = Logger('AuthInterceptor');

  /// Headers that should be stored in local storage when received in response
  static const storableHeaders = {
    ApiConstants.AUTHORIZATION,
    ApiConstants.S_JWT_TOKEN,
    ApiConstants.KEY_METHOD,
    ApiConstants.KEY_VALUE,
  };

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      await addAuthHeaders(options);
      super.onRequest(options, handler);
    } catch (e, stackTrace) {
      _log.severe('Error adding auth headers', e, stackTrace);
      handler.reject(
        DioException(
          requestOptions: options,
          error: 'Failed to add authentication headers',
        ),
      );
    }
  }

  /// Adds authentication headers to the request
  addAuthHeaders(RequestOptions options) async {
    // Add cookie header only for non-web platforms
    if (!kIsWeb) {
      final cookie = await LocalStorage.getCookie();
      if (cookie != null && cookie.isNotEmpty) {
        options.headers[ApiConstants.SET_COOKIE] = cookie;
      }
    }

    final authorization = await LocalStorage.getAuthorization();
    final jwtToken = await LocalStorage.getJwtToken();

    // Add standard auth headers
    options.headers.addAll({
      ApiConstants.CONTENT_TYPE: ApiConstants.APPLICATION_JSON,
      ApiConstants.ACCEPT: ApiConstants.APPLICATION_JSON,
      ApiConstants.LOGIN_TYPE: ApiConstants.API,
      ApiConstants.USER_LANG: LanguageController().appsLanguage,

      if (authorization?.isNotEmpty ?? false)
        ApiConstants.AUTHORIZATION: authorization,
      if (jwtToken?.isNotEmpty ?? false) ApiConstants.S_JWT_TOKEN: jwtToken,
    });

    return;
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    try {
      super.onResponse(response, handler);
      updateSessionStore(response);
    } catch (e, stackTrace) {
      _log.severe('Error updating session store', e, stackTrace);
      // Continue with the response even if session store update fails
      super.onResponse(response, handler);
    }
  }

  /// Updates the session store with headers from the response
  void updateSessionStore(Response response) async {
    final headers = response.headers.map;

    // Check if OTP is not valid for Login
    if (headers.containsKey(ApiConstants.VALID_OTP)) {
      if (headers[ApiConstants.VALID_OTP]!.first == 'false') {
        await 100.milliseconds.delay;
        AlertDialogUtils().showOkAlertDialog(
          NavigationService.navigatorKey.currentContext!,
          title: l.S
              .of(NavigationService.navigatorKey.currentContext!)
              .invalid_otp,
          msg: l.S
              .of(NavigationService.navigatorKey.currentContext!)
              .please_enter_valid_otp,
        );
      }
    }

    // Update standard headers
    for (final headerKey in storableHeaders) {
      updateHeader(headers, headerKey);
    }

    // Handle cookies for non-web platforms
    if (!kIsWeb) {
      updateCookies(headers);
    }
  }

  /// Updates a specific header in local storage
  void updateHeader(Map<String, List<String>> headers, String headerKey) {
    // Check both normal and lowercase versions of the header
    final headerValue = _getHeaderValue(headers, headerKey);
    if (headerValue != null) {
      switch (headerKey) {
        case ApiConstants.AUTHORIZATION:
          LocalStorage.setAuthorization(headerValue);
          break;
        case ApiConstants.S_JWT_TOKEN:
          LocalStorage.setJwtToken(headerValue);
          break;
        case ApiConstants.KEY_METHOD:
          LocalStorage.setKeyMethod(headerValue);
          break;
        case ApiConstants.KEY_VALUE:
          LocalStorage.setKeyValue(headerValue);
          break;
      }
    }
  }

  /// Gets the header value checking both normal and lowercase versions
  String? _getHeaderValue(Map<String, List<String>> headers, String headerKey) {
    return headers[headerKey]?.firstOrNull ??
        headers[headerKey.toLowerCase()]?.firstOrNull;
  }

  /// Updates cookies from response headers
  void updateCookies(Map<String, List<String>> headers) {
    final cookiesList = headers[ApiConstants.SET_COOKIE];
    if (cookiesList == null || cookiesList.isEmpty) return;

    try {
      final cookies = cookiesList
          .map((cookie) => cookie.split(';').first.trim())
          .where((cookie) => cookie.isNotEmpty)
          .join('; ');

      if (cookies.isNotEmpty) {
        LocalStorage.setCookie(cookies);
        _log.fine('Updated cookies in local storage');
      }
    } catch (e, stackTrace) {
      _log.warning('Error processing cookies', e, stackTrace);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _log.warning('Network error: ${err.type}', err.error, err.stackTrace);
    super.onError(err, handler);
  }
}
