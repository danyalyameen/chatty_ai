import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/icons_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShowBottomSheetForImportImages {
  static void bottomSheet({
    required BuildContext context,
    required double width,
    required double height,
  }) {
    List<Map<String, dynamic>> attachmentOptions = [
      {
        "Icon": IconsPath.camera,
        "Title": "Camera",
      },
      {
        "Icon": IconsPath.gallery,
        "Title": "Gallery",
      },
    ];
    String iconKey = "Icon";
    String titleKey = "Title";
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(
          showDragHandle: true,
          dragHandleColor: AppColors.black60,
          dragHandleSize: Size(width * 0.2, height * 0.005),
          backgroundColor: AppColors.primaryLight,
          constraints:
              BoxConstraints(minHeight: height * 0.25, minWidth: width),
          onClosing: () {},
          builder: (context) {
            return SizedBox(
              width: width,
              height: height * 0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  attachmentOptions.length,
                  (index) {
                    return Container(
                      width: width * 0.3,
                      height: height * 0.1,
                      margin: EdgeInsets.only(
                        top: height * 0.02,
                        bottom: height * 0.02,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(
                          width * 0.02,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: height * 0.01,
                              ),
                              child: SvgPicture.asset(
                                attachmentOptions[index][iconKey],
                                width: width * 0.1,
                                height: width * 0.1,
                                colorFilter: ColorFilter.mode(
                                    AppColors.primaryLight, BlendMode.srcIn),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.005,
                            ),
                            Text(
                              attachmentOptions[index][titleKey],
                              style: TextStyle(
                                color: AppColors.primaryLight,
                                fontSize: width * 0.045,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
