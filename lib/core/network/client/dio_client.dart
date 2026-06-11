import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:quickslot/core/network/interceptors/auth_interceptor.dart';
import 'package:quickslot/core/network/services/base_api_service.dart';
import 'package:quickslot/core/network/utils/api_constants.dart';

/// A DioClient that handle HTTP requests with proper error handling and configuration
class DioClient {
  final Dio _dio;

  /// Creates a new DioClient with proper configuration
  DioClient()
    : _dio = Dio(
        BaseOptions(
          baseUrl: BaseApiService.baseUrl,
          followRedirects: true,
          validateStatus: (status) => status != null && status <= 505,
          responseType: ResponseType.plain,
          connectTimeout: const Duration(seconds: ApiConstants.TIME_DURATION),
          receiveTimeout: const Duration(seconds: ApiConstants.TIME_DURATION),
          headers: {
            ApiConstants.CONTENT_TYPE: ApiConstants.APPLICATION_JSON,
            ApiConstants.ACCEPT: ApiConstants.APPLICATION_JSON,
          },
        ),
      ) {
    _initializeInterceptors();
  }

  // Initialize interceptors for authentication, logging, and error handling
  void _initializeInterceptors() {
    // Authentication handling
    _dio.interceptors.add(AuthInterceptor());

    // Error Handling
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          // Handle network errors
          if (error.type == DioExceptionType.connectionTimeout ||
              error.type == DioExceptionType.receiveTimeout ||
              error.type == DioExceptionType.sendTimeout) {
            debugPrint('NetWork timeout error: ${error.message}');
          }

          // Handle connection errors
          if (error.type == DioExceptionType.connectionError) {
            debugPrint('Connection error:${error.message}');
          }

          return handler.next(error);
        },
      ),
    );

    // Add logging in debug mode
    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          logPrint: (obj) => debugPrint(obj.toString()),
        ),
      );
    }
  }

  // Get the Dio instance
  Dio get dio => _dio;

  /// Dispose resources
  void dispose() {
    _dio.close();
  }
}
