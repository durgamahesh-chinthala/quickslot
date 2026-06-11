import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ToastUtils {
  void showSuccessToast(BuildContext context, String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green[700],
      textColor: Colors.white,
      fontSize: 16.0,
      webPosition: "center",
      timeInSecForIosWeb: 2,
    );
  }

  void showErrorToast(BuildContext context, String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red[700],
      textColor: Colors.white,
      fontSize: 16.0,
      webPosition: "center",
      timeInSecForIosWeb: 2,
    );
  }

  void showInfoToast(BuildContext context, String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.orange[700],
      textColor: Colors.white,
      fontSize: 16.0,
      webPosition: "center",
      timeInSecForIosWeb: 2,
    );
  }
}
