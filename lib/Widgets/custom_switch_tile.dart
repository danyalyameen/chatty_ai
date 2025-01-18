import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/icons_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSwitchTile extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;
  final String title;
  final double width;
  final bool isIcon;
  final String? icon;
  const CustomSwitchTile(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.title,
      required this.width,
      required this.isIcon,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return isIcon
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: SvgPicture.asset(
                  icon ?? IconsPath.darkMode,
                  width: width * 0.086,
                ),
              ),
              SizedBox(
                width: width * 0.03,
              ),
              Text(
                title,
                style: TextStyle(
                  color: AppColors.primaryBlack,
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(),
              SizedBox(
                width: width * 0.14,
                child: Switch(
                  value: value,
                  onChanged: onChanged,
                  activeColor: AppColors.primaryLight,
                  activeTrackColor: AppColors.primary,
                  inactiveTrackColor: AppColors.grey60,
                  inactiveThumbColor: AppColors.primaryLight,
                  trackOutlineColor: WidgetStatePropertyAll(AppColors.grey60),
                ),
              ),
            ],
          )
        : Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppColors.primaryBlack,
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(),
              SizedBox(
                width: width * 0.14,
                child: Switch(
                  value: value,
                  onChanged: onChanged,
                  activeColor: AppColors.primaryLight,
                  activeTrackColor: AppColors.primary,
                  inactiveTrackColor: AppColors.grey60,
                  inactiveThumbColor: AppColors.primaryLight,
                  trackOutlineColor: WidgetStatePropertyAll(AppColors.grey60),
                ),
              ),
            ],
          );
  }
}
