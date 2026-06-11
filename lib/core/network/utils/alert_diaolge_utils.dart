import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:universal_html/html.dart' as web;

import 'package:quickslot/features/loan/controller/loan_controller.dart';
import 'package:quickslot/features/login/controller/login_controller.dart';
import 'package:quickslot/generated/l10n.dart' as l;
import 'package:quickslot/routes/navigation_service.dart';
import 'package:quickslot/utils/common/get_image_widget.dart';
import 'package:quickslot/utils/common/mb_spacing.dart';
import 'package:quickslot/utils/constants/image_constants.dart';
import 'package:quickslot/utils/constants/value_constants.dart';
import 'package:quickslot/utils/theme/app_colors.dart';

class AlertDialogUtils {
  void showOkAlertDialog(
    BuildContext context, {
    required String title,
    required String msg,
    Function? onTap,
  }) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
          content: Text(msg, style: Theme.of(context).textTheme.bodyMedium),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              ValueConstants.BORDER_RADIUS_10,
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                if (onTap != null) {
                  onTap();
                }
              },
              child: Text(l.S().ok),
            ),
          ],
        );
      },
    );
  }

  void showOkAlertDialogWithIcon(
    BuildContext context, {
    required Widget icon,
    required String title,
    required String msg,
    bool isDismissible = true,
    Function? onTap,
  }) {
    showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (_) {
        return WillPopScope(
          onWillPop: () async {
            return isDismissible;
          },
          child: AlertDialog(
            titlePadding: MBSpacing.fromLTRB(24, 24, 24, 0),

            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon,
                MBSpacing.height(ValueConstants.HEIGHT_14),
                // Title
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                MBSpacing.height(ValueConstants.HEIGHT_18),

                // Description
                Text(
                  msg,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                MBSpacing.height(ValueConstants.HEIGHT_24),
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                ValueConstants.BORDER_RADIUS_10,
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (onTap != null) {
                    onTap();
                  }
                },
                child: Text(l.S().ok),
              ),
            ],
          ),
        );
      },
    );
  }

  noInternetDialogDynamic() {
    noInternetDialog(
      NavigationService.navigatorKey.currentState!.context,
      l.S.of(NavigationService.navigatorKey.currentContext!).oops,
      l.S
          .of(NavigationService.navigatorKey.currentContext!)
          .currently_offline_msg,
    );
  }

  noInternetDialog(
    BuildContext context,
    String title,
    String message, {
    Color? color,
    Function? ontap,
  }) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (buildcontext) {
        return AlertDialog(
          icon: const Icon(Icons.network_check_outlined),
          title: Center(
            child: Text(title, style: Theme.of(context).textTheme.bodyLarge),
          ),
          content: Text(message, style: Theme.of(context).textTheme.bodyMedium),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.PARTIAL_COLOR,
                  foregroundColor: AppColors.WHITE_COLOR,
                  shadowColor: Colors.transparent,
                  padding: MBSpacing.symmetric(
                    horizontal: ValueConstants.PADDING_24,
                    vertical: ValueConstants.PADDING_12,
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  ontap?.call();
                },
                child: Text(l.S.of(context).try_again),
              ),
            ),
          ],
        );
      },
    );
  }

  void showSessionExpired(
    BuildContext context, {
    required String title,
    required String msg,
    Function? onTap,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: AlertDialog(
            title: Text(title),
            content: Text(msg),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (onTap != null) {
                    onTap();
                  }
                },
                child: Text(l.S.of(context).ok),
              ),
            ],
          ),
        );
      },
    );
  }

  showToastMessage({
    required String msg,
    ToastGravity toastPosition = ToastGravity.BOTTOM,
    Color backgroundColor = AppColors.NEUTRAL_900,
  }) {
    Fluttertoast.showToast(
      webBgColor: "#171717",
      backgroundColor: backgroundColor,
      textColor: AppColors.WHITE_COLOR,
      msg: msg,
      timeInSecForIosWeb: 4,
      webPosition: "center",
      gravity: toastPosition, // Useful for mobile
    );
  }

  showLogoutDialog(BuildContext context) {
    final loginController = LoginController();

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          titlePadding: MBSpacing.fromLTRB(24, 24, 24, 0),

          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(AntDesign.login, color: AppColors.PRIMARY_500),
              MBSpacing.height(ValueConstants.HEIGHT_14),
              // Title
              Text(
                l.S().logout,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              MBSpacing.height(ValueConstants.HEIGHT_18),

              // Description
              Text(
                l.S().sure_to_logout,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              MBSpacing.height(ValueConstants.HEIGHT_24),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              ValueConstants.BORDER_RADIUS_10,
            ),
          ),
          actions: [
            // No Button
            ElevatedButton(
              onPressed: () {
                loginController.isLogoutLoading = false;
                // Close the dialog
                Navigator.pop(NavigationService.navigatorKey.currentContext!);
              },
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: AppColors.PRIMARY_500, width: 1),
                backgroundColor:
                    AppColors.WHITE_COLOR, // Optional: match outline look
                foregroundColor: AppColors.PRIMARY_500, // Text/Icon color
                elevation: 0, // Optional: remove elevation
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    8,
                  ), // Optional: rounded corners
                ),
              ),
              child: Text(l.S().no),
            ),

            // Yes Button
            Observer(
              builder: (_) {
                return ElevatedButton(
                  onPressed: loginController.isLogoutLoading
                      ? () {
                          return;
                        }
                      : () async {
                          loginController.invokeLogout(context);
                        },
                  child: loginController.isLogoutLoading
                      ? const SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(
                            color: AppColors.WHITE_COLOR,
                            strokeWidth: 2,
                          ),
                        )
                      : Text(l.S().logout),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void showCustomSnackBar(
    BuildContext context,
    String message, {
    Color backgroundColor = Colors.black,
    Duration duration = const Duration(seconds: 3),
    IconData icon = Icons.error,
  }) {
    final snackBar = SnackBar(
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Prefix icon
          Icon(icon, color: AppColors.WHITE_COLOR),
          MBSpacing.width(ValueConstants.WIDTH_12),

          // Message Widget
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: AppColors.WHITE_COLOR),
            ),
          ),

          // Close Button
          InkWell(
            onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
            child: Padding(
              padding: MBSpacing.all(ValueConstants.PADDING_4),
              child: const Icon(
                Icons.close,
                color: AppColors.WHITE_COLOR,
                size: ValueConstants
                    .ICON_SIZE_20, // smaller size to reduce height
              ),
            ),
          ),
        ],
      ),
      backgroundColor: backgroundColor.withOpacity(0.8),
      behavior: SnackBarBehavior.floating,
      margin: MBSpacing.all(ValueConstants.MARGIN_16),
      duration: duration,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ValueConstants.BORDER_RADIUS_8),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Loan cancel alert dialog
  showLoanProcessExitAlertDialog(
    BuildContext context, {
    required String title,
    required String desc,
    required Function onTap,
  }) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          titlePadding: MBSpacing.fromLTRB(24, 24, 24, 0),

          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                ImageConstants.ALERT_LOTTIE,
                height: 80,
                fit: BoxFit.contain,
              ),
              MBSpacing.height(ValueConstants.HEIGHT_14),
              // Title
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              MBSpacing.height(ValueConstants.HEIGHT_18),

              // Description
              Text(
                desc,
                textAlign: TextAlign.start,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontSize: 16),
              ),
              MBSpacing.height(ValueConstants.HEIGHT_24),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              ValueConstants.BORDER_RADIUS_10,
            ),
          ),
          actions: [
            Column(
              children: [
                // Exit Button
                Observer(
                  builder: (_) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Close the dialog
                          Navigator.pop(context);

                          onTap();
                        },
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                            color: AppColors.PRIMARY_500,
                            width: 1,
                          ),
                          backgroundColor: AppColors
                              .WHITE_COLOR, // Optional: match outline look
                          foregroundColor:
                              AppColors.PRIMARY_500, // Text/Icon color
                          elevation: 0, // Optional: remove elevation
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              ValueConstants.BORDER_RADIUS_8,
                            ),
                          ),
                        ),
                        child: LoanController().isLoanCancelUiLoading
                            ? const SizedBox(
                                height: ValueConstants.HEIGHT_20,
                                width: ValueConstants.WIDTH_20,
                                child: CircularProgressIndicator(
                                  color: Colors.red,
                                  strokeWidth: 2.2,
                                ),
                              )
                            : Text(l.S().exit),
                      ),
                    );
                  },
                ),
                MBSpacing.height(ValueConstants.HEIGHT_12),

                // No Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(l.S().continuoe),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  showUpdateDialog(String latestVersion) {
    showDialog(
      context: NavigationService.navigatorKey.currentContext!,
      builder: (context) => AlertDialog(
        title: Text(l.S.of(context).update_available_title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            getImageWidget(ImageConstants.UPDATE_IME, height: 180)!,

            Text(
              l.S.of(context).update_available_msg(latestVersion),
              style: Theme.of(context).textTheme.labelLarge,
            ),
            MBSpacing.height(ValueConstants.HEIGHT_4),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              // Close the dialog
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              side: const BorderSide(color: AppColors.PRIMARY_500, width: 1),
              backgroundColor: AppColors.WHITE_COLOR,
              foregroundColor: AppColors.PRIMARY_500,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(l.S().later),
          ),

          Observer(
            builder: (_) {
              return ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);

                  _handleAllowAction();
                },
                child: Text(l.S.of(context).refresh),
              );
            },
          ),
        ],
      ),
    );
  }

  _handleAllowAction() async {
    // Clear localStorage/sessionStorage
    web.window.localStorage.clear();
    web.window.sessionStorage.clear();

    // Clear caches in Cache Storage API
    if (web.window.caches != null) {
      final keys = await web.window.caches!.keys();
      for (final key in keys) {
        await web.window.caches!.delete(key);
      }
    }

    // Unregister service workers
    final swRegistration = await web.window.navigator.serviceWorker
        ?.getRegistrations();
    if (swRegistration != null) {
      for (final registration in swRegistration) {
        await registration.unregister();
      }
    }

    final origin = web.window.location.origin;
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    web.window.location.href = '$origin?v=$timestamp';
  }
}
