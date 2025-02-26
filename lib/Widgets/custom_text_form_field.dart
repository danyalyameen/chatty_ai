import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/icons_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatelessWidget {
  final String title, hintText;
  final String? icon;
  final VoidCallback? onPressed;
  final Color? iconColor;
  final TextEditingController? controller;
  final String? Function(String? value)? validate;
  final double? iconSize;
  final bool? obscureText;
  final bool showIcon;
  const CustomTextFormField(
      {super.key,
      required this.title,
      required this.hintText,
      this.icon,
      this.onPressed,
      this.iconColor,
      this.controller,
      this.validate,
      this.iconSize,
      this.obscureText,
      required this.showIcon});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            title,
            style: TextStyle(
              color: AppColors.primaryBlack,
              fontSize: width * 0.04,
              fontWeight: FontWeight.w800,
            ),
          ),
          // Text Form Field
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller,
            cursorColor: AppColors.primary,
            style: TextStyle(
              color: AppColors.primaryBlack,
              fontSize: width * 0.045,
              fontWeight: FontWeight.w800,
            ),
            obscureText: obscureText != null ? obscureText! : false,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: AppColors.black60,
                fontSize: width * 0.045,
                fontWeight: FontWeight.w700,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primary,
                  width: width * 0.005,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primary,
                  width: width * 0.005,
                ),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primaryRed,
                  width: width * 0.005,
                ),
              ),
              suffixIcon: showIcon
                  ? UnconstrainedBox(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(width),
                        onTap: onPressed,
                        child: SvgPicture.asset(
                          icon ?? IconsPath.darkMode,
                          colorFilter: ColorFilter.mode(
                            iconColor ?? AppColors.primary,
                            BlendMode.srcIn,
                          ),
                          width: iconSize ?? width * 0.09,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
            validator: (value) {
              return validate != null ? validate!(value) : null;
            },
          )
        ],
      ),
    );
  }
}
