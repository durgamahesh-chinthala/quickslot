// 🎯 Dart imports:
// ignore_for_file: constant_identifier_names, deprecated_member_use, non_constant_identifier_names

import 'package:flutter/material.dart';

abstract class AppColors {
  //---------------Base Colors---------------//
  static const BLACK_COLOR = Colors.black87;
  static const WHITE_COLOR = Color(0xffffffff);
  static const BLACK_COLOR_33 = Color(0xFF333333);

  // static const scaffoldBgColor = Color(0xffF5F7F8);
  static const SCAFFOLF_BG_COLOR_LIGHT = WHITE_COLOR;
  static const SCAFFOLF_BG_COLOR_DARK = Color(0xff000000);

  //---------------Transparent---------------//
  static const TRANSPARENT = Colors.transparent;

  //---------------Primary Colors---------------//
  static const PRIMARY_50 = Color(0xFFE4ECF1);
  static const PRIMARY_100 = Color(0xFFBCD0E0);
  static const PRIMARY_200 = Color(0xFF92B3CE);
  static const PRIMARY_300 = Color(0xFF6896BD);
  static const PRIMARY_400 = Color(0xFF4A80B0);
  static const PRIMARY_500 = Color(0xFF2D6289);
  static const PRIMARY_600 = Color(0xFF28587A);
  static const PRIMARY_700 = Color(0xFF224A68);
  static const PRIMARY_800 = Color(0xFF1B3B56);
  static const PRIMARY_900 = Color.fromARGB(255, 21, 47, 75);

  static const TRANSACTION_CARD_BACKGROUND_COLOR = Color(0xFFFAFBFC);

  //---------------Secondary Colors---------------//
  static const SECONDARY_COLOR = Color.fromARGB(255, 253, 175, 6);

  //---------------Neutral Colors---------------//
  static const NEUTRAL_50 = Color(0xffF6F6F6);
  static const NEUTRAL_100 = Color(0xffF5F5F5);
  static const NEUTRAL_200 = Color(0xffE5E5E5);
  static const NEUTRAL_300 = Color(0xffD4D4D4);
  static const NEUTRAL_400 = Color(0xffA3A3A3);
  static const NEUTRAL_500 = Color(0xff737373);
  static const NEUTRAL_600 = Color(0xff525252);
  static const NEUTRAL_700 = Color(0xff404040);
  static const NEUTRAL_800 = Color(0xff262626);
  static const NEUTRAL_900 = Color(0xff171717);

  //---------------Success Colors---------------//
  static const SUCCESS = Color(0xff00B243);
  static final SUCCESS_20Op = SUCCESS.withOpacity(0.20);

  //---------------Info Colors---------------//
  static const INFO = Color(0xff1D4ED8);
  static final INFO_20Op = INFO.withOpacity(0.20);

  //---------------Warning Colors---------------//
  static const WARNING = Color(0xffFD7F0B);
  static final WARNING_20Op = WARNING.withOpacity(0.20);

  //---------------Error Colors---------------//
  static const ERROR = Color(0xffE40F0F);
  static final ERROR_20Op = ERROR.withOpacity(0.20);

  //---------------Danger Colors---------------//
  static const DANGER = Color(0xffFF5724);

  //---------------Dark Colors---------------//
  static const DARK_1 = Color(0xff0F172A);
  static const DARK_2 = Color(0xff1E293B);
  static const DARK_3 = Color(0xff334155);

  //---------------Other Colors---------------//
  static const SECONDARY_BTN_COLOR = Color(0xff3577F1);

  //---------------Partial Color---------------//
  static const PARTIAL_COLOR = Color(0xffAF52DE);

  static const CARD_SHADOW = Color.fromARGB(255, 233, 236, 238);

  static const TEXT_INPUT_BORDER_COLOR = Color.fromARGB(255, 228, 233, 235);

  static const GREY = Colors.grey;

  static const Color WARNING_ORANGE = Color(0xFFF59E0B);

  static const Color SUCCESS_COLOR = Color.fromARGB(255, 34, 111, 85);
  static const Color TEXT_DARK = Color(0xff1f2937);
  static const Color TEXT_LIGHT = Color(0xff6b7280);
  static const Color BACKGROUND = Color(0xfffafbfc);

  // Background Gradient Colors
  static const Color BACKGROUND_GRADIENT_START = Color(0xFFF8FAFC);
  static const Color BACKGROUND_GRADIENT_END = Color(0xFFE2E8F0);

  // Success Colors
  static const Color SUCCESS_600 = Color(0xFF16A34A);
  static const Color SUCCESS_700 = Color(0xFF15803D);
  static const Color SUCCESS_500 = Color(0xFF22C55E);
  static const Color SUCCESS_200 = Color(0xFFBBF7D0);
  static const Color SUCCESS_100 = Color(0xFFDCFCE7);
  static const Color SUCCESS_50 = Color(0xFFF0FDF4);

  // Info Colors
  static const Color INFO_600 = Color(0xFF0284C7);
  static const Color INFO_700 = Color(0xFF0369A1);
  static const Color INFO_200 = Color(0xFFBAE6FD);
  static const Color INFO_50 = Color(0xFFF0F9FF);

  static const Color DEEP_ORANGE_ACCENT = Colors.deepOrangeAccent;
  static const Color DEEP_ORANGE = Colors.deepOrange;

  static const GREY_50 = Color(0xFFF8FAFC);
  static const GREY_100 = Color(0xFFF1F5F9);
  static const GREY_200 = Color(0xFFE2E8F0);
  static const GREY_300 = Color(0xFFCBD5E1);
  static const GREY_400 = Color(0xFF94A3B8);
  static const GREY_500 = Color(0xFF64748B);
  static const GREY_600 = Color(0xFF475569);
  static const GREY_700 = Color(0xFF334155);
  static const GREY_800 = Color(0xFF1E293B);
  static const GREY_900 = Color(0xFF0F172A);

  static const WARNING_500 = Color(0xFFF59E0B);
  static const WARNING_100 = Color(0xFFFEF3C7);
  static const ERROR_500 = Color(0xFFEF4444);
  static const ERROR_100 = Color(0xFFFEE2E2);

  static const Color KYC_CARD_BUTTON = Color(0xFF10B981);
  static const Color DARK_GRAY = Color(0xFF1F2937);
  static const Color MEDIUM_GRAY = Color(0xFF374151);

  static const Color PRE_APPROVED_PRIMARY = Color(0xFF007A33);
  static const Color PRE_APPROVED_SECONDARY = Color(0xFF66B3A1);
  static const Color PRE_APPROVED_SHADOW = Color(0xFF007A33);
  static const Color PRE_APPROVED_BUTTON = Colors.white;
  static const Color PRE_APPROVED_BUTTON_SHADOW = Colors.black;
  static const Color PRE_APPROVED_TEXT_SHADOW = Colors.black;
  static const Color PRE_APPROVED_ACCENT = Colors.white;

  static const OVER_DUE_SECTION_COLOR = Color(0xFFEF4444);

  // Colors
  static Color BLUE_50 = Colors.blue.shade50;
  static Color INDIGO_50 = Colors.indigo.shade50;
  static const Color BLACK_87 = Colors.black87;
  static const Color BLACK_54 = Colors.black54;
  static const Color SUPPORT_CARD_GRADIENT_1 = Color(0xFFE3F2FD);
  static const Color SUPPORT_CARD_GRADIENT_2 = Color(0xFFBBDEFB);
  static const Color SUPPORT_CARD_GRADIENT_3 = Color(0xFFF6E8BB);
  static const Color SUPPORT_CARD_GRADIENT_4 = Color(0xFFF3D788);
  static const Color SUPPORT_ICON_COLOR = Color(0xFFB58905);

  static Color BLUE_100 = Colors.blue.shade100;
  static Color BLUE_300 = Colors.blue.shade300;
  static Color BLUE_600 = Colors.blue.shade600;

  static Color SUPPORT_TICKET_ORANGE_500 = Colors.orange.shade500;
  static Color BLUE_500 = Colors.blue.shade500;
  static Color GREEN_500 = Colors.green.shade500;
  static Color BLUE_GREY_500 = Colors.blueGrey.shade500;

  static Color RED_400 = Colors.red.shade400;

  static const Color BLACK = Colors.black;
  static const Color RED = Colors.red;
  static Color RED_100 = Colors.red.shade100;
  static Color PROFILE_STATS_COLOR = Colors.blue.shade100;
  static Color GREEN_400 = Colors.green.shade400;
  static Color GREEN_600 = Colors.green.shade600;
  static const Color BLUE = Colors.blue;
  static const Color INDIGO = Colors.indigo;
  static const Color PURPLE = Colors.purple;
  static const Color TEAL = Colors.teal;
  static const Color ORANGE = Colors.orange;
  static const Color CYAN = Colors.cyan;
}

// Minimal spacing helper used by theme
class MBSpacing {
  static const EdgeInsets zero = EdgeInsets.zero;
  static EdgeInsets fromLTRB(double l, double t, double r, double b) => EdgeInsets.fromLTRB(l, t, r, b);
}

class ValueConstants {
  static const BORDER_RADIUS_6 = 6.0;
  static const BORDER_RADIUS_12 = 12.0;
  static const PADDING_X24_Y12 = EdgeInsets.symmetric(horizontal: 24, vertical: 12);
  static const PADDING_X24_Y40 = EdgeInsets.symmetric(horizontal: 24, vertical: 40);
  static const HEIGHT_XL = SizedBox(height: 24);
  static const HEIGHT_MEDIUM = SizedBox(height: 12);
  static const HEIGHT_XXL = SizedBox(height: 32);
  static const WIDTH_20 = 20.0;
  static const HEIGHT_20 = 20.0;
  static const STROKE_WIDTH_2 = 2.0;
  static const ICON_SIZE_64 = 64.0;
  static const FONT_SIZE_L = 18.0;
  static const FONT_SIZE_S = 14.0;
}

abstract class AppTheme {
  static ThemeData kLightTheme() {
    final base = ThemeData.light();
    return base.copyWith(
      scaffoldBackgroundColor: AppColors.SCAFFOLF_BG_COLOR_LIGHT,
      colorScheme: const ColorScheme.light(
        primary: AppColors.PRIMARY_600,
        onPrimary: AppColors.WHITE_COLOR,
        secondary: AppColors.NEUTRAL_200,
        error: AppColors.ERROR,
      ),
      appBarTheme: base.appBarTheme.copyWith(backgroundColor: AppColors.PRIMARY_600, foregroundColor: AppColors.WHITE_COLOR),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.PRIMARY_600,
          foregroundColor: AppColors.WHITE_COLOR,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(ValueConstants.BORDER_RADIUS_6)),
          padding: ValueConstants.PADDING_X24_Y12,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.PRIMARY_600),
          padding: ValueConstants.PADDING_X24_Y12,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: MBSpacing.fromLTRB(12, 12, 10, 12),
        isDense: true,
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: AppColors.NEUTRAL_300)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: AppColors.PRIMARY_600)),
      ),
    );
  }
}
