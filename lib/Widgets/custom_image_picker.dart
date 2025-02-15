import 'dart:async';
import 'dart:io';

import 'package:chatty_ai/App/app.locator.dart';
import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/icons_path.dart';
import 'package:chatty_ai/Services/Image%20Service/image_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked_services/stacked_services.dart';

class ShowBottomSheetForImportImages {
  static Future<File?> bottomSheet({
    required BuildContext context,
    required double width,
    required double height,
  }) async {
    // Variables
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
    ImageService imageService = locator<ImageService>();
    File? image;
    Completer<File> completer = Completer<File>();
    // Show Bottom Sheet
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
            return Container(
              width: width,
              height: height * 0.1,
              margin: EdgeInsets.only(top: height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // Generating Two Widgets Camera and Gallery
                children: List.generate(
                  attachmentOptions.length,
                  (index) {
                    return InkWell(
                      onTap: () async {
                        image = await imageService.pickImage(
                            imageFromCamera: index == 0 ? true : false);
                        completer.complete(image);
                        NavigationService().back();
                      },
                      borderRadius: BorderRadius.circular(
                        width * 0.04,
                      ),
                      child: Container(
                        width: width * 0.3,
                        height: height * 0.1,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(
                            width * 0.04,
                          ),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              // Icon
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
                              // For Spacing
                              SizedBox(
                                height: height * 0.005,
                              ),
                              // Text
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
    return completer.future;
  }
}
