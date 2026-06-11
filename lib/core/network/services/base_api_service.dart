// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:universal_html/html.dart';

import 'package:quickslot/core/network/config/api_end_points.dart';
import 'package:quickslot/core/network/config/status_codes.dart';
import 'package:quickslot/core/network/utils/api_constants.dart';
import 'package:quickslot/main.dart';

/// Defines the environment flavors for the application
enum FlavorType { PROD, DEV, DEMO, TEST }

/// Base API service that defines common API operations and URL configuration.
/// All API services should extend this class.
abstract class BaseApiService {
  static final _log = Logger('BaseApiService');

  /// Current API version
  static const String API_VERSION = ApiEndPoints.API_VERSION;

  /// Default base URL
  static String _baseUrl = ApiConstants.PROD_BASE_URL;

  /// Get the current base URL
  static String get baseUrl => _baseUrl;

  /// UTC timestamp for request tracking
  static String? utc = HttpStatusCodes.OK.toString();

  /// Initializes the base URL based on the environment and platform
  static void initializeBaseUrl() {
    try {
      // Uncomment below code when need to configure web base URL----------------

      /*
      if (kIsWeb) {
        configureWebBaseUrl();
      } else {
        configureNativeBaseUrl();
      }
      */

      //-------------------------------------------------------------------------

      // Remove the below statement when above code is uncommented---------------
      configureNativeBaseUrl();
      //-------------------------------------------------------------------------

      _log.info('Base URL initialized: $_baseUrl');
    } catch (e, stackTrace) {
      _log.severe('Failed to initialize base URL', e, stackTrace);
      throw ApiConstants.INVALID_BASE_URL;
    }
  }

  /// Configures base URL for web platform
  static void configureWebBaseUrl() {
    try {
      final uri = window.location;
      _baseUrl = '${uri.protocol}//${uri.host}/';

      // If localhost, use the flavor-specific URL
      if (_baseUrl.contains(ApiConstants.LOCAL_HOST_URL)) {
        configureNativeBaseUrl();
      }
    } catch (e, stackTrace) {
      _log.severe('Failed to configure web base URL', e, stackTrace);
      throw ApiConstants.INVALID_BASE_URL;
    }
  }

  /// Configures base URL for native platforms based on flavor
  static void configureNativeBaseUrl() {
    try {
      final flavor = flavorType?.toUpperCase();

      switch (flavor) {
        case ApiConstants.PROD:
          _baseUrl = ApiConstants.PROD_BASE_URL;
          break;
        case ApiConstants.DEV:
          _baseUrl = ApiConstants.DEV_BASE_URL;
          break;
        case ApiConstants.DEMO:
          _baseUrl = ApiConstants.DEMO_BASE_URL;
          break;
        default:
          _baseUrl = ApiConstants.PROD_BASE_URL;
          _log.warning('Unknown flavor type: $flavor, using PROD as default');
          break;
      }
    } catch (e, stackTrace) {
      _log.severe('Failed to configure native base URL', e, stackTrace);
      throw ApiConstants.INVALID_BASE_URL;
    }
  }

  /// Performs a GET request to the specified endpoint
  ///
  /// [endPoint] - The API endpoint to call
  /// [queryParameters] - Optional query parameters
  /// [hasUserInteraction] - Whether the request is triggered by user interaction
  Future<dynamic> getRequest(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
    bool? hasUserInteraction = true,
    ResponseType? responseType,
  });

  /// Performs a POST request to the specified endpoint
  ///
  /// [endPoint] - The API endpoint to call
  /// [queryParameters] - Optional query parameters
  /// [body] - Request body
  /// [isLogin] - Whether this is a login request
  /// [hasUserInteraction] - Whether the request is triggered by user interaction
  /// [responseType] - Response type (e.g., json, plain text)
  Future<dynamic> postRequest(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
    bool isLogin = false,
    bool hasUserInteraction = true,
    ResponseType? responseType,
  });

  /// Performs a PUT request to the specified endpoint
  ///
  /// [endPoint] - The API endpoint to call
  /// [queryParameters] - Optional query parameters
  /// [body] - Request body
  /// [hasUserInteraction] - Whether the request is triggered by user interaction
  Future<dynamic> putRequest(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
    bool hasUserInteraction = true,
  });

  /// Performs a PATCH request to the specified endpoint
  ///
  /// [endPoint] - The API endpoint to call
  /// [queryParameters] - Optional query parameters
  /// [body] - Request body
  /// [hasUserInteraction] - Whether the request is triggered by user interaction
  Future<dynamic> patchRequest(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
    bool hasUserInteraction = true,
  });

  /// Performs a DELETE request to the specified endpoint
  ///
  /// [endPoint] - The API endpoint to call
  /// [queryParameters] - Optional query parameters
  /// [body] - Request body
  /// [hasUserInteraction] - Whether the request is triggered by user interaction
  Future<dynamic> deleteRequest(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
    bool hasUserInteraction = true,
  });
}
