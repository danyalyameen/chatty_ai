import 'dart:ui';

import 'package:chatty_ai/Constants/constants.dart';

class AppColors {
  // Primary Color of App
  static const Color primary = Color(0xFF17CE92);
  static const Color primary60 = Color(0xFFE8FAF4);
  static const Color primary40 = Color(0xFFEEFBF7);
  static const Color primary20 = Color(0xFFE7FAF4);
  // White Color
  static Color backgroundColor =
      Constants.isDark ? Color(0xFF181A20) : Color(0xFFFFFFFF);
  // Black Colors
  static Color textColor =
      Constants.isDark ? Color(0xFFEFEFEF) : Color(0xFF212121);
  static const Color black80 = Color(0xFF606060);
  static const Color black60 = Color(0xFF9F9F9F);
  static const Color black40 = Color(0xFFFAFAFA);
  // Grey Colors
  static const Color grey = Color(0xFFF5F5F5);
  static const Color grey80 = Color(0xFF9E9E9E);
  static const Color grey60 = Color(0xFFEFEFEF);
  static const Color grey40 = Color(0xFFEEEEED);
  // Red Color
  static const Color primaryRed = Color(0xFFF85555);
  // Other Colors
  static const Color capabilitiesTitle = Color(0xFFBBBBBB);
}
