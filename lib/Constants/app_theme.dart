import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.backgroundColor,
      secondary: AppColors.primary,
      onSecondary: AppColors.backgroundColor,
      error: AppColors.primaryRed,
      onError: AppColors.backgroundColor,
      surface: AppColors.backgroundColor,
      onSurface: AppColors.textColor,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primary,
      onPrimary: AppColors.backgroundColor,
      secondary: AppColors.primary,
      onSecondary: AppColors.backgroundColor,
      error: AppColors.primaryRed,
      onError: AppColors.backgroundColor,
      surface: AppColors.textColor,
      onSurface: AppColors.grey,
    ),
  );
}
