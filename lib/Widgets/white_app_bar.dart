import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/icons_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

PreferredSizeWidget whiteAppBar({
  List<Widget>? actions,
  required bool backArrow,
  required String title,
  required double width,
}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        color: AppColors.primaryBlack,
        fontSize: width * 0.055,
        fontWeight: FontWeight.w600,
      ),
    ),
    actions: actions,
    centerTitle: true,
    backgroundColor: AppColors.primaryLight,
    leading: backArrow
        ? Center(
            child: SvgPicture.asset(
              IconsPath.backArrow,
              width: width * 0.09,
              height: width * 0.09,
            ),
          )
        : Padding(
            padding: EdgeInsets.only(left: width * 0.03),
            child: Center(
              child: SvgPicture.asset(
                IconsPath.appLogo,
                width: width * 0.09,
                height: width * 0.09,
              ),
            ),
          ),
  );
}
