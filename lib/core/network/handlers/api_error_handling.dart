import 'package:flutter/material.dart';

import 'package:quickslot/core/network/handlers/api_error_constants.dart';
import 'package:quickslot/core/network/utils/alert_diaolge_utils.dart';
import 'package:quickslot/generated/l10n.dart';

class ApiErrorHandling {
  AlertDialogUtils alertDialogUtils = AlertDialogUtils();

  void handleErrorMap(Map<String, dynamic> errMap, BuildContext context) {
    try {
      if (errMap.containsKey("errMap")) {
        Map<String, dynamic> errorMap = errMap['errMap'];
        for (String value in errorMap.values) {
          // Show backend error message directly in snackbar
          AlertDialogUtils().showCustomSnackBar(
            context,
            value.toString(), // Use the backend error message directly
          );
        }
      } else if (errMap.containsKey("inputErrMap")) {
        Map<String, dynamic> inputErrorMap = errMap['inputErrMap'];
        for (String value in inputErrorMap.values) {
          // Show backend error message directly in snackbar
          AlertDialogUtils().showCustomSnackBar(
            context,
            value.toString(), // Use the backend error message directly
          );
        }
      } else {
        // Fallback for unknown error format
        AlertDialogUtils().showCustomSnackBar(
          context,
          'Something went wrong. Please try again.',
        );
      }
    } catch (e) {
      // If anything fails, show generic error
      AlertDialogUtils().showCustomSnackBar(
        context,
        'Something went wrong. Please try again.',
      );
    }
  }

  Map<String, List<String>> errorMessageList = {
    ERROR_CODE_USER_OBJ_FOUND: [
      'User Already Exists',
      'A user with the given details already exists.',
    ],

    ERROR_CODE_BORROWER_OBJ_NOT_FOUND: [
      'Borrower Not Found',
      'No borrower record found for the given details.',
    ],

    ERROR_CODE_BORROWER_SIGNUP_COMPLETED: [
      'Signup Already Completed',
      'The borrower has already completed the signup process.',
    ],

    ERROR_CODE_BORROWER_MOBILE: [
      'Mobile Number Error',
      'There was an issue with the mobile number provided.',
    ],

    ERROR_CODE_BORROWER_MOBILE_DUPLICATE: [
      'Duplicate Mobile Number',
      'The mobile number is already registered with another user.',
    ],

    ERROR_CODE_BORROWER_INVALID_MOBILE_OTP: [
      'Invalid OTP',
      'The entered OTP is invalid.',
    ],

    ERROR_CODE_BORROWER_MOBILE_OTP_MIS_MATCH: [
      'Mobile OTP Mismatch',
      'The entered OTP does not match the sent OTP.',
    ],

    ERROR_CODE_BORROWER_MOBILE_OTP_EXPIRED: [
      'OTP Expired',
      'The OTP has expired. Please request a new one.',
    ],

    ERROR_CODE_AADHAAR: [
      'Aadhaar Error',
      'There was an issue with the Aadhaar number provided.',
    ],

    ERROR_CODE_DUPLIATE_AADHAAR: [
      'Duplicate Aadhaar Number',
      'The Aadhaar is already registered with another user.',
    ],

    ERROR_CODE_AADHAAR_PROCESSING_ERROR: [
      'Aadhaar Processing Error',
      'An error occurred while processing the Aadhaar details.',
    ],

    ERROR_CODE_AADHAAR_OTP_INVALID: [
      'Invalid OTP',
      'The entered OTP is invalid.',
    ],

    ERROR_CODE_AADHAAR_OTP_EXPIRED: [
      'OTP Expired',
      'The OTP has expired. Please request a new one.',
    ],

    ERROR_CODE_BORROWER_PAN: [
      'PAN Error',
      'There was an issue with the PAN number provided.',
    ],

    ERROR_CODE_DUPLICATE_PAN: [
      'Duplicate PAN Number',
      'The PAN number is already registered with another user.',
    ],

    ERROR_CODE_BORROWER_ACC_NUM: [
      'Account Number Error',
      'The provided bank account number is invalid or incomplete.',
    ],

    ERROR_CODE_DUPLICATE_BORROWER_ACC_NUM: [
      'Duplicate Account Number',
      'The bank account number is already registered with another user.',
    ],

    ERROR_CODE_BORROWER_IFSC: [
      'Invalid IFSC Code',
      'The provided IFSC code is not valid. Please check and try again.',
    ],

    ERROR_CODE_INVALID_SIGNUP_STEP: [
      'Invalid Signup Step',
      'The current signup step is invalid or out of sequence.',
    ],

    ERROR_CODE_AADHAAR_OTP_PROCESSING_ERROR: [
      'OTP Error',
      'An error occurred while verifying the OTP.',
    ],

    ERROR_CODE_BANK_ACC_PROCESSING_ERROR: [
      'Processing Error',
      'An error occurred while validating the bank account details.',
    ],

    ERROR_CODE_PAN_PROCESSING_ERROR: [
      'Processing Error',
      'An error occurred while verifying the PAN details.',
    ],

    ERROR_CODE_BORROWER_KYC_PENDING: [
      'KYC Pending',
      "Your KYC verification is in progress. Please wait for approval or try again later",
    ],

    ERROR_CODE_BORROWER_KYC_REJECTED: [
      "KYC Rejected",
      "Your KYC verification was unsuccessful. Please contact support for assistance.",
    ],

    ERROR_CODE_SIGNUP_COMPLETED: [
      "Account Already Exists",
      "You’ve already completed the signup process. Please log in to continue.",
    ],

    ERROR_CODE_USER_NOT_FOUND: [
      "Account Required",
      "You haven’t created an account yet. Please sign up to continue.",
    ],
  };
}
