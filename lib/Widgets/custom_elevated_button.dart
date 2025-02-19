import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomElevatedButton extends StatelessWidget {
  final double width, height;
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final bool elevation;
  final bool? isLoading;
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
      this.isLoading,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height * 0.07,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            isLoading ?? false
                ? backgroundColor ?? AppColors.primary60
                : backgroundColor ?? AppColors.primary,
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width),
            ),
          ),
          elevation: WidgetStatePropertyAll(
            elevation ? 10 : 0,
          ),
          shadowColor: WidgetStatePropertyAll(
            AppColors.primary.withValues(alpha: 0.5),
          ),
        ),
        child: isLoading ?? false
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
