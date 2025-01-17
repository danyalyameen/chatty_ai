import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final double width, height;
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final bool elevation;
  const CustomElevatedButton(
      {super.key,
      required this.width,
      this.onPressed,
      required this.text,
      required this.height,
      this.backgroundColor,
      required this.elevation});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.9,
      height: height * 0.07,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            backgroundColor ?? AppColors.primary,
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
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.primaryLight,
            fontSize: width * 0.05,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
