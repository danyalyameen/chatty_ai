import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/icons_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked_services/stacked_services.dart';

PreferredSizeWidget whiteAppBar({
  List<Widget>? actions,
  required bool backArrow,
  bool? showLogo,
  required String title,
  required double width,
  NavigationService? navigationService,
}) {
  return AppBar(
    // Title
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
    // back arrow
    leading: backArrow
        ? InkWell(
            borderRadius: BorderRadius.circular(width),
            onTap: () {
              navigationService?.back();
            },
            child: Center(
              child: SvgPicture.asset(
                IconsPath.backArrow,
                width: width * 0.09,
                height: width * 0.09,
              ),
            ),
          )
        : showLogo == true
            ? Padding(
                padding: EdgeInsets.only(left: width * 0.03),
                child: Center(
                  child: SvgPicture.asset(
                    IconsPath.appLogo,
                    width: width * 0.09,
                    height: width * 0.09,
                  ),
                ),
              )
            : const SizedBox(),
  );
}
