import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:quickslot/core/network/client/dio_client.dart';
import 'package:quickslot/core/network/config/api_response.dart';
import 'package:quickslot/core/network/services/base_api_service.dart';
import 'package:quickslot/core/network/utils/alert_diaolge_utils.dart';
import 'package:quickslot/core/network/utils/api_constants.dart';

/// A service class for handling network API requests using the Dio package.
/// This class provides methods for making HTTP requests and processing responses.
class NetworkApiService extends BaseApiService {
  final DioClient _dioClient;

  /// Constructs a new instance of NetworkApiService with a default DioClient.
  NetworkApiService() : _dioClient = DioClient();

  /// Gets the Dio instance for making HTTP requests.
  Dio get dio => _dioClient.dio;

  final AlertDialogUtils alertDialogUtils = AlertDialogUtils();

  /// Handles the HTTP request with the specified method and endpoint.
  ///
  /// Parameters:
  /// - [method]: The HTTP method to use (GET, POST, etc.)
  /// - [endPoint]: The API endpoint to call
  /// - [body]: The request body (optional)
  /// - [queryParameters]: Query parameters for the request (optional)
  /// - [responseType]: The expected response type (optional)
  /// - [isLogin]: Whether this is a login request (defaults to false)
  /// - [hasUserInteraction]: Whether to show user-facing dialogs (defaults to true)
  ///
  /// Returns:
  /// - The processed response if successful
  /// - Throws an exception if an error occurs
  Future<dynamic> _handleRequest(
    String method,
    String endPoint, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    ResponseType? responseType,
    bool? isLogin = false,
    bool? hasUserInteraction = true,
  }) async {
    try {
      if (!await isNetworkAvailable()) {
        alertDialogUtils.noInternetDialogDynamic();
        throw ApiConstants.NO_NETWORK;
      }

      // Append `utResCode` to the endpoint if applicable
      String? urc = BaseApiService.utc;
      if (urc != null && urc.isNotEmpty) {
        endPoint = endPoint.contains('?')
            ? '$endPoint&utResCode=$urc'
            : '$endPoint?utResCode=$urc';
      }

      final options = Options(responseType: responseType, method: method);

      final response = await dio
          .request(
            endPoint,
            data: body,
            queryParameters: queryParameters,
            options: options,
          )
          .timeout(
            const Duration(seconds: ApiConstants.TIME_DURATION),
            onTimeout: () {
              throw ApiConstants.PLEASE_TRY_AGAIN;
            },
          );

      final apiResponse = ApiResponse();
      Response? newReponse = await apiResponse.returnResponse(
        response,
        isLogin: isLogin!,
        hasUserInteraction: hasUserInteraction!,
      );

      return newReponse;
    } catch (e) {
      rethrow;
    }
  }

  /// Sends a GET request to the specified endpoint.
  ///
  /// Parameters:
  /// - [endPoint]: The API endpoint to call
  /// - [queryParameters]: Query parameters for the request (optional)
  /// - [hasUserInteraction]: Whether to show user-facing dialogs (defaults to true)
  ///
  /// Returns:
  /// - The processed response if successful
  /// - Throws an exception if an error occurs
  @override
  Future<dynamic> getRequest(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
    bool? hasUserInteraction = true,
    bool? isLogin = false,
    ResponseType? responseType,
  }) async {
    return await _handleRequest(
      ApiConstants.GET,
      endPoint,
      queryParameters: queryParameters,
      hasUserInteraction: hasUserInteraction,
      isLogin: isLogin,
      responseType: responseType,
    );
  }

  /// Sends a POST request to the specified endpoint.
  ///
  /// Parameters:
  /// - [endPoint]: The API endpoint to call
  /// - [queryParameters]: Query parameters for the request (optional)
  /// - [body]: The request body (optional)
  /// - [isLogin]: Whether this is a login request (defaults to false)
  /// - [hasUserInteraction]: Whether to show user-facing dialogs (defaults to true)
  /// - [responseType]: The expected response type (optional)
  ///
  /// Returns:
  /// - The processed response if successful
  /// - Throws an exception if an error occurs
  @override
  Future<dynamic> postRequest(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
    bool? isLogin = false,
    bool? hasUserInteraction = true,
    ResponseType? responseType,
  }) async => await _handleRequest(
    ApiConstants.POST,
    endPoint,
    queryParameters: queryParameters,
    body: body,
    isLogin: isLogin,
    hasUserInteraction: hasUserInteraction,
    responseType: responseType,
  );

  /// Sends a PUT request to the specified endpoint.
  ///
  /// Parameters:
  /// - [endPoint]: The API endpoint to call
  /// - [queryParameters]: Query parameters for the request (optional)
  /// - [body]: The request body (optional)
  /// - [hasUserInteraction]: Whether to show user-facing dialogs (defaults to true)
  ///
  /// Returns:
  /// - The processed response if successful
  /// - Throws an exception if an error occurs
  @override
  Future<dynamic> putRequest(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
    bool? hasUserInteraction = true,
  }) async => await _handleRequest(
    ApiConstants.PUT,
    endPoint,
    queryParameters: queryParameters,
    body: body,
    hasUserInteraction: hasUserInteraction,
  );

  /// Sends a PATCH request to the specified endpoint.
  ///
  /// Parameters:
  /// - [endPoint]: The API endpoint to call
  /// - [queryParameters]: Query parameters for the request (optional)
  /// - [body]: The request body (optional)
  /// - [hasUserInteraction]: Whether to show user-facing dialogs (defaults to true)
  ///
  /// Returns:
  /// - The processed response if successful
  /// - Throws an exception if an error occurs
  @override
  Future<dynamic> patchRequest(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
    bool? hasUserInteraction = true,
  }) async => await _handleRequest(
    ApiConstants.PATCH,
    endPoint,
    queryParameters: queryParameters,
    body: body,
    hasUserInteraction: hasUserInteraction,
  );

  /// Sends a DELETE request to the specified endpoint.
  ///
  /// Parameters:
  /// - [endPoint]: The API endpoint to call
  /// - [queryParameters]: Query parameters for the request (optional)
  /// - [body]: The request body (optional)
  /// - [hasUserInteraction]: Whether to show user-facing dialogs (defaults to true)
  ///
  /// Returns:
  /// - The processed response if successful
  /// - Throws an exception if an error occurs
  @override
  Future<dynamic> deleteRequest(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
    bool? hasUserInteraction = true,
  }) async => await _handleRequest(
    ApiConstants.DELETE,
    endPoint,
    queryParameters: queryParameters,
    body: body,
    hasUserInteraction: hasUserInteraction,
  );
}
