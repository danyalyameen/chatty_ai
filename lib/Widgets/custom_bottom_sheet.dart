import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet {
  // Bottom Sheet of Clear All History
  static void bottomSheet({
    required BuildContext context,
    required String title,
    required String description,
    required String cancelTitle,
    required String confirmTitle,
    VoidCallback? onPressed,
    TextStyle? titleStyle,
    double? sheetHeight,
  }) {
    // Get Screen Size of a Device
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    bool showLoading = false;
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: AppColors.backgroundColor,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SizedBox(
              height: sheetHeight ?? height * 0.3,
              child: Column(
                children: [
                  // Title
                  Text(
                    title,
                    style: titleStyle ??
                        TextStyle(
                          fontSize: width * 0.055,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  // For Spacing
                  SizedBox(
                    height: height * 0.008,
                  ),
                  // For Line Between Title and Description
                  Divider(
                    color: AppColors.textColor,
                    thickness: width * 0.0005,
                    indent: width * 0.05,
                    endIndent: width * 0.05,
                  ),
                  // For Spacing
                  SizedBox(
                    height: height * 0.008,
                  ),
                  // Description
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                    child: Text(
                      description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: width * 0.044,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  // For Spacing
                  SizedBox(
                    height: height * 0.03,
                  ),
                  // Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Cancel Button
                      SizedBox(
                        width: width * 0.25,
                        height: height * 0.06,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              AppColors.primary20,
                            ),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(width),
                              ),
                            ),
                          ),
                          child: Text(
                            cancelTitle,
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      // For Spacing
                      SizedBox(
                        width: width * 0.04,
                      ),
                      // Confirm Button
                      CustomElevatedButton(
                        width: width * 0.6,
                        text: confirmTitle,
                        height: height,
                        elevation: true,
                        showLoading: showLoading,
                        onPressed: () {
                          setState(() {
                            showLoading = true;
                          });
                          onPressed?.call();
                          setState(
                            () {
                              showLoading = false;
                            },
                          );
                        },
                        fontSize: width * 0.046,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
