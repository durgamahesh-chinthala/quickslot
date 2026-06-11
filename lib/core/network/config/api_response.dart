import 'dart:convert';

import 'package:quickslot/core/network/config/api_end_points.dart';
import 'package:quickslot/core/network/handlers/api_error_constants.dart';
import 'package:quickslot/core/network/utils/toast_utils.dart';
import 'package:quickslot/features/login/screen/login_screen.dart';
import 'package:quickslot/utils/constants/route_name_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:quickslot/core/network/client/dio_client.dart';
import 'package:quickslot/core/network/config/refresh_token_manager.dart';
import 'package:quickslot/core/network/config/status_codes.dart';
import 'package:quickslot/core/network/handlers/api_error_handling.dart';
import 'package:quickslot/core/network/utils/alert_diaolge_utils.dart';
import 'package:quickslot/core/network/utils/api_constants.dart';
import 'package:quickslot/core/network/utils/api_exception.dart';
import 'package:quickslot/generated/l10n.dart' as l;
import 'package:quickslot/routes/navigation_service.dart';
import 'package:quickslot/store/local_storage.dart';

/// A class that handles API responses and provides centralized error handling and response processing.
/// This class manages HTTP responses, authentication, session handling, and error dialogs.
class ApiResponse {
  final AlertDialogUtils _alertDialogUtils = AlertDialogUtils();
  final RefreshTokenManager _refreshTokenManager = RefreshTokenManager();
  final DioClient _dioClient;

  /// Creates a new instance of ApiResponse with a default DioClient.
  ApiResponse() : _dioClient = DioClient();

  /// Gets the Dio instance for making HTTP requests.
  Dio get dio => _dioClient.dio;

  /// Processes the API response and handles different status codes appropriately.
  ///
  /// Parameters:
  /// - [response]: The HTTP response to process
  /// - [isLogin]: Whether this is a login request (defaults to false)
  /// - [hasUserInteraction]: Whether to show user-facing dialogs (defaults to true)
  ///
  /// Returns:
  /// - The processed response if successful
  /// - null if an error occurs
  Future<Response?> returnResponse(
    Response response, {
    bool isLogin = false,
    bool hasUserInteraction = true,
  }) async {
    try {
      if (_isSuccessResponse(response)) {
        return response;
      }

      if (!hasUserInteraction) {
        return _handleNonInteractiveResponse(response);
      }

      switch (response.statusCode) {
        case HttpStatusCodes.TEMPORARY_REDIRECT:
          await handleContextBar();
          return response;

        case HttpStatusCodes.BAD_REQUEST:
          return await _handleBadRequest(response);

        case HttpStatusCodes.UNAUTHORIZED:
          return await _handleUnauthorized(response, isLogin);

        case HttpStatusCodes.FORBIDDEN:
          return await _handleForbidden(response);

        case HttpStatusCodes.NOT_FOUND:
          return await _handleNotFound(response, isLogin);

        case HttpStatusCodes.METHOD_NOT_ALLOWED:
          return await _handleMethodNotAllowed(response);
        case HttpStatusCodes.INTERNAL_SERVER_ERROR:
          return await _handleInternalServerError(response);

        case HttpStatusCodes.GATEWAY_TIMEOUT:
          return await _handleGatewayTimeout(response);

        default:
          await _handleUnknownError(response);
      }
    } catch (e) {
      debugPrint('Unknown error: $e');
      return null;
    }
    return null;
  }

  /// Handles the context bar functionality by fetching company list and context data.
  /// Shows context selection widget if company list is not empty.
  Future<void> handleContextBar() async {
    // final contextBarController = ContextBarController();
    // await contextBarController.getCompanyListByPodIdAPI();
    // await contextBarController.getContextDataFromLocalStorage(
    //   isAlltheContextDataLoading: true,
    // );
    // if (contextBarController.companyList?.data.isNotEmpty ?? false) {
    //   contextBarSelectionWidget(
    //     NavigationService.navigatorKey.currentContext!,
    //     contextBarController,
    //   );
    // }
  }

  /// Handles HTTP 400 (Bad Request) responses.
  /// Shows appropriate error dialog based on response data.
  Future<Response?> _handleBadRequest(Response response) async {
    try {
      if (response.data != null) {
        dynamic errorMap = response.data;
        final decodeErrmap = jsonDecode(errorMap);

        if (decodeErrmap['errMap'].values.first ==
            ERROR_CODE_AADHAAR_CONSENT_MISSING) {
          NavigationService.navigatorKey.currentContext!.push(
            RouteNameConstants.KYC_STEPS_SCREEN,
          );
          await Future.delayed(const Duration(milliseconds: 100));

          AlertDialogUtils().showCustomSnackBar(
            NavigationService.navigatorKey.currentContext!,
            l.S
                .of(NavigationService.navigatorKey.currentContext!)
                .aadhaar_verification_failed,
          );
          return response;
        }

        showErrorDialog(decodeErrmap);
      }
    } catch (e) {
      rethrow;
    }
    return response;
  }

  /// Shows an error dialog based on the provided error map.
  void showErrorDialog(Map<String, dynamic> errorMap) {
    try {
      if (errorMap.containsKey("errMap")) {
        Map<String, dynamic> backendErrorMap = errorMap['errMap'];
        // Show first error message from backend
        if (backendErrorMap.isNotEmpty) {
          final firstErrorMessage = backendErrorMap.values.first.toString();
          // AlertDialogUtils().showCustomSnackBar(
          //   NavigationService.navigatorKey.currentContext!,
          //   firstErrorMessage,
          // );
          ToastUtils().showErrorToast(
            NavigationService.navigatorKey.currentContext!,
            firstErrorMessage,
          );
        }
      } else if (errorMap.containsKey("inputErrMap")) {
        Map<String, dynamic> inputErrorMap = errorMap['inputErrMap'];
        // Show first error message from backend
        if (inputErrorMap.isNotEmpty) {
          final firstErrorMessage = inputErrorMap.values.first.toString();
          // AlertDialogUtils().showCustomSnackBar(
          //   NavigationService.navigatorKey.currentContext!,
          //   firstErrorMessage,
          // );
          ToastUtils().showErrorToast(
            NavigationService.navigatorKey.currentContext!,
            firstErrorMessage,
          );
        }
      } else {
        // Fallback
        AlertDialogUtils().showCustomSnackBar(
          NavigationService.navigatorKey.currentContext!,
          'Something went wrong. Please try again.',
        );
      }
    } catch (e) {
      // If anything fails, show generic error
      AlertDialogUtils().showCustomSnackBar(
        NavigationService.navigatorKey.currentContext!,
        'Something went wrong. Please try again.',
      );
    }
  }

  /// Handles HTTP 403 (Forbidden) responses.
  /// Shows technical issue dialog and throws ForbiddenException.
  Future<Response?> _handleForbidden(Response response) async {
    _alertDialogUtils.showCustomSnackBar(
      NavigationService.navigatorKey.currentContext!,
      l.S
          .of(NavigationService.navigatorKey.currentContext!)
          .technical_issue_title,
    );
    throw ForbiddenException(response.data.toString());
  }

  /// Handles HTTP 404 (Not Found) responses.
  /// Shows not found dialog and throws NotFounException.
  Future<Response?> _handleNotFound(Response response, bool isLogin) async {
    // Normalize paths by removing leading slashes
    String requestPath = response.requestOptions.uri.path.startsWith('/')
        ? response.requestOptions.uri.path.substring(1)
        : response.requestOptions.uri.path;
    if (requestPath == ApiEndPoints.URI_BORROWER_KYC_READ ||
        requestPath == ApiEndPoints.URI_BORROWER_READ_PIC) {
      return response; // Return response without dialog or exception
    }
    if (isLogin) {
      await showAlertDialog(
        title: 'Account Required',
        msg: 'You haven’t created an account yet. Please sign up to continue.',
      );
    } else {
      await showAlertDialog(
        title: l.S
            .of(NavigationService.navigatorKey.currentContext!)
            .not_found_title,
        msg: l.S
            .of(NavigationService.navigatorKey.currentContext!)
            .not_found_msg,
      );
    }
    throw NotFounException(response.data.toString());
  }

  /// Handles HTTP 405 (Method Not Allowed) responses.
  /// Shows technical issue dialog and throws MethodNotAllowedException.
  Future<Response?> _handleMethodNotAllowed(Response response) async {
    _alertDialogUtils.showCustomSnackBar(
      NavigationService.navigatorKey.currentContext!,
      l.S
          .of(NavigationService.navigatorKey.currentContext!)
          .technical_issue_title,
    );
    throw MethodNotAllowedException(response.data.toString());
  }

  /// Handles HTTP 500 (Internal Server Error) responses.
  /// Shows technical issue dialog and throws InternalServerException.
  Future<Response?> _handleInternalServerError(Response response) async {
    _alertDialogUtils.showCustomSnackBar(
      NavigationService.navigatorKey.currentContext!,
      l.S
          .of(NavigationService.navigatorKey.currentContext!)
          .technical_issue_title,
    );
    throw InternalServerException(response.data.toString());
  }

  /// Handles HTTP 504 (Gateway Timeout) responses.
  /// Shows technical issue dialog and throws GateWayTimeException.
  Future<Response?> _handleGatewayTimeout(Response response) async {
    _alertDialogUtils.showCustomSnackBar(
      NavigationService.navigatorKey.currentContext!,
      l.S
          .of(NavigationService.navigatorKey.currentContext!)
          .technical_issue_title,
    );
    throw GateWayTimeException(response.data.toString());
  }

  /// Handles unknown error responses.
  /// Shows generic technical issue dialog.
  Future<void> _handleUnknownError(Response response) async {
    _alertDialogUtils.showCustomSnackBar(
      NavigationService.navigatorKey.currentContext!,
      l.S
          .of(NavigationService.navigatorKey.currentContext!)
          .technical_issue_title,
    );
  }

  /// Shows an alert dialog with the specified title and message.
  Future<void> showAlertDialog({
    required String title,
    required String msg,
  }) async {
    _alertDialogUtils.showOkAlertDialog(
      NavigationService.navigatorKey.currentContext!,
      title: title,
      msg: msg,
    );
  }

  /// Shows an error dialog based on the provided error map.
  // void showErrorDialog(Map<String, dynamic> errorMap) {
  //   final apiErrorHandling = ApiErrorHandling();
  //   apiErrorHandling.handleErrorMap(
  //     errorMap,
  //     NavigationService.navigatorKey.currentContext!,
  //   );
  // }

  /// Generic method to handle API responses and convert them to specified type.
  ///
  /// Parameters:
  /// - [apiCall]: The API call to execute
  /// - [fromJson]: Function to convert response data to specified type
  ///
  /// Returns:
  /// - Parsed response data of type T
  /// - null if response is empty or invalid
  static Future<T?> handleApiResponse<T>(
    Future<dynamic> apiCall,
    T Function(dynamic) fromJson,
  ) async {
    try {
      Response response = await apiCall;

      if (response.statusCode == HttpStatusCodes.OK) {
        if (response.data != null && response.data.isNotEmpty) {
          return fromJson(jsonDecode(response.data));
        }
        return null;
      }
      throw response;
    } catch (e) {
      rethrow;
    }
  }

  /// Handles status responses and returns the response if status is OK or Bad Request.
  static Future<Response?> handleStatusResponse(
    Future<dynamic> responseFuture,
  ) async {
    try {
      Response customerResp = await responseFuture;
      return (customerResp.statusCode == HttpStatusCodes.OK ||
              customerResp.statusCode == HttpStatusCodes.BAD_REQUEST)
          ? customerResp
          : null;
    } catch (e) {
      rethrow;
    }
  }

  /// Shows session expired alert dialog and handles logout functionality.
  showSessionAlertDialog() {
    AlertDialogUtils alerDialogUtils = AlertDialogUtils();
    alerDialogUtils.showSessionExpired(
      onTap: () async {
        await 300.milliseconds.delay;
        Navigator.pushReplacement(
          NavigationService.navigatorKey.currentContext!,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      },
      NavigationService.navigatorKey.currentContext!,
      title: "Session is Expired",
      msg: "Your session is expired. Please login again!",
    );
  }

  /// Checks if the response status code indicates success.
  /// Success is defined as status codes between 200 and 299.
  bool _isSuccessResponse(Response response) {
    return response.statusCode != null &&
        response.statusCode! >= HttpStatusCodes.OK &&
        response.statusCode! <= HttpStatusCodes.CUSTOM_SUCCESS;
  }

  /// Handles non-interactive responses (when hasUserInteraction is false).
  /// Only processes unauthorized responses in this case.
  Future<Response?> _handleNonInteractiveResponse(Response response) async {
    if (response.statusCode == HttpStatusCodes.UNAUTHORIZED) {
      return await _handleUnauthorized(response, false);
    }
    return response;
  }

  /// Handles HTTP 401 (Unauthorized) responses.
  /// Manages login attempts, session expiration, and token refresh.
  Future<Response?> _handleUnauthorized(Response response, bool isLogin) async {
    // Check if the response body contains the specific error message
    try {
      final Map<String, dynamic> body = jsonDecode(response.data);

      if (body['errorMsg'] == "User not allowed for login type:APP") {
        _alertDialogUtils.showCustomSnackBar(
          NavigationService.navigatorKey.currentContext!,
          l.S
              .of(NavigationService.navigatorKey.currentContext!)
              .user_log_in_warning_msg,
        );
        return null;
      }
    } catch (e) {
      if (isLogin) return response;

      if (!await _isUserLoggedIn()) {
        await showSessionAlertDialog();
        return null;
      }

      try {
        final retriedResponse = await _retryRequestWithRefresh(response);

        return retriedResponse;
      } catch (e) {
        await showSessionAlertDialog();
        throw ApiConstants.SESSION_EXPIRED;
      }
    }
    return null;
  }

  /// Checks if the user is currently logged in.
  /// Verifies user credentials in local storage.
  Future<bool> _isUserLoggedIn() async {
    final isLoggedIn = LocalStorage.getLoggedInUser() == true;
    final userName = await LocalStorage.getUserName();
    final password = await LocalStorage.getPassword();

    return isLoggedIn &&
        userName != null &&
        userName.isNotEmpty &&
        password != null &&
        password.isNotEmpty;
  }

  /// Retries the failed request after refreshing the authentication token.
  ///
  /// Parameters:
  /// - [response]: The original failed response
  ///
  /// Returns:
  /// - New response after retrying with refreshed token
  /// - Throws timeout exception if request takes too long
  Future<Response?> _retryRequestWithRefresh(Response response) async {
    await _refreshTokenManager.handleRefreshIfNeeded(response);

    final requestOptions = response.requestOptions;
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    final newResponse = await dio
        .request(
          requestOptions.path,
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters,
          options: options,
        )
        .timeout(
          const Duration(seconds: ApiConstants.TIME_DURATION),
          onTimeout: () => throw ApiConstants.PLEASE_TRY_AGAIN,
        );

    return returnResponse(newResponse);
  }
}
