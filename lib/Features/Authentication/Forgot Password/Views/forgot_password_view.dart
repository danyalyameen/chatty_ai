import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/icons_path.dart';
import 'package:chatty_ai/Features/Authentication/Forgot%20Password/Views/forgot_password_view_model.dart';
import 'package:chatty_ai/Widgets/custom_elevated_button.dart';
import 'package:chatty_ai/Widgets/custom_text_form_field.dart';
import 'package:chatty_ai/Widgets/white_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordView extends StackedView<ForgotPasswordViewModel> {
  final String title;
  const ForgotPasswordView({required this.title, super.key});

  final String buttonText = "Continue";

  @override
  Widget builder(
      BuildContext context, ForgotPasswordViewModel viewModel, Widget? child) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      resizeToAvoidBottomInset: false,
      appBar: whiteAppBar(
        backArrow: true,
        title: title,
        width: width,
        navigationService: viewModel.navigationService,
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: width * 0.05, top: height * 0.04, right: width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            // Title and Description
            _ForgotPasswordTexts(
              width: width,
              height: height,
            ),
            // For Spacing
            SizedBox(
              height: height * 0.04,
            ),
            // Authentication Text Form Fields
            _AuthFields(
              width: width,
            ),
            // For Spacing
            SizedBox(
              height: height * 0.48,
            ),
            // Continue Button
            CustomElevatedButton(
              width: width,
              text: buttonText,
              height: height,
              elevation: true,
              onPressed: () => viewModel.navigationService.back(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ForgotPasswordViewModel viewModelBuilder(BuildContext context) =>
      ForgotPasswordViewModel();
}

class _ForgotPasswordTexts extends StatelessWidget {
  final double width, height;
  const _ForgotPasswordTexts({required this.width, required this.height});

  final String title = "Reset Your Password 🔑";
  final String description =
      "Please enter your email and we will send an link to your email to reset your password.";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          title,
          style: TextStyle(
            color: AppColors.primaryBlack,
            fontWeight: FontWeight.w700,
            fontSize: width * 0.07,
          ),
        ),
        // For Spacing
        SizedBox(
          height: height * 0.02,
        ),
        // Description
        Text(
          description,
          style: TextStyle(
            color: AppColors.primaryBlack,
            fontWeight: FontWeight.w300,
            fontSize: width * 0.042,
          ),
        )
      ],
    );
  }
}

class _AuthFields extends ViewModelWidget<ForgotPasswordViewModel> {
  final double width;
  const _AuthFields({required this.width});

  final String emailText = "Email";

  @override
  Widget build(BuildContext context, ForgotPasswordViewModel viewModel) {
    return CustomTextFormField(
      title: emailText,
      hintText: emailText,
      icon: IconsPath.email,
      iconSize: width * 0.06,
      showIcon: true,
      onPressed: () {},
    );
  }
}
