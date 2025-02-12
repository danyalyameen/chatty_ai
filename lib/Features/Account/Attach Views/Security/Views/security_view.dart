import 'package:chatty_ai/App/app.router.dart';
import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Features/Account/Attach%20Views/Security/Views/security_view_model.dart';
import 'package:chatty_ai/Widgets/custom_elevated_button.dart';
import 'package:chatty_ai/Widgets/custom_switch_tile.dart';
import 'package:chatty_ai/Widgets/white_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SecurityView extends StackedView<SecurityViewModel> {
  const SecurityView({super.key});

  final String title = "Security";
  final String rememberMe = "Remember me";
  final String biometricID = "Biometric ID";
  final String faceID = "Face ID";
  final String changePassword = "Change Password";

  @override
  Widget builder(
      BuildContext context, SecurityViewModel viewModel, Widget? child) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      appBar: whiteAppBar(
        backArrow: true,
        title: title,
        width: width,
        navigationService: viewModel.navigationService,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.02),
        child: Column(
          children: [
            // Remember Me Switch
            CustomSwitchTile(
              value: viewModel.rememberMe,
              onChanged: (value) => viewModel.rememberMeOnValueChanged(value),
              title: rememberMe,
              width: width,
              isIcon: false,
            ),
            // Biometric Switch
            CustomSwitchTile(
              value: viewModel.biometricID,
              onChanged: (value) => viewModel.biometricIDOnValueChanged(value),
              title: biometricID,
              width: width,
              isIcon: false,
            ),
            // Face ID
            CustomSwitchTile(
              value: viewModel.faceID,
              onChanged: (value) => viewModel.faceIDValueChanged(value),
              title: faceID,
              width: width,
              isIcon: false,
            ),
            // For Spacing
            SizedBox(
              height: height * 0.04,
            ),
            // Change Password Button
            CustomElevatedButton(
              width: width,
              height: height,
              text: changePassword,
              elevation: false,
              textColor: AppColors.primary,
              backgroundColor: AppColors.primary20,
              onPressed: () => viewModel.navigationService
                  .navigateToForgotPasswordView(title: "Reset Password"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  SecurityViewModel viewModelBuilder(BuildContext context) =>
      SecurityViewModel();
}
