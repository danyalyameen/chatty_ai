import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomElevatedButton extends StatelessWidget {
  // Variables Required
  final double width, height;
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final bool elevation;
  final bool? showLoading;
  final double? fontSize;
  const CustomElevatedButton(
      {super.key,
      required this.width,
      this.onPressed,
      required this.text,
      required this.height,
      this.backgroundColor,
      required this.elevation,
      this.textColor,
      this.showLoading,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height * 0.07,
      child: ElevatedButton(
        // Call Back
        onPressed: onPressed,
        // Button Style
        style: ButtonStyle(
          // Background Color
          backgroundColor: WidgetStatePropertyAll(
            showLoading ?? false
                ? backgroundColor ?? AppColors.primary60
                : backgroundColor ?? AppColors.primary,
          ),
          // Border Radius
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width),
            ),
          ),
          // Elevation
          elevation: WidgetStatePropertyAll(
            elevation ? 10 : 0,
          ),
          // Shadow
          shadowColor: WidgetStatePropertyAll(
            AppColors.primary.withValues(alpha: 0.5),
          ),
        ),
        // Child
        child: showLoading ?? false
            ? Center(
                child: SpinKitThreeBounce(
                  color: AppColors.primary,
                  size: width * 0.06,
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  color: textColor ?? AppColors.primaryLight,
                  fontSize: fontSize ?? width * 0.05,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
