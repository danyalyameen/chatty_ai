import 'package:chatty_ai/App/app.router.dart';
import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/icons_path.dart';
import 'package:chatty_ai/Features/Authentication/Sign%20up/Views/sign_up_view_model.dart';
import 'package:chatty_ai/Widgets/custom_elevated_button.dart';
import 'package:chatty_ai/Widgets/custom_text_form_field.dart';
import 'package:chatty_ai/Widgets/white_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class SignUpView extends StackedView<SignUpViewModel> {
  const SignUpView({super.key});

  // Variables
  final String title = "Sign up";
  final String buttonText = "Continue";

  // Disposing Controllers
  @override
  void onDispose(SignUpViewModel viewModel) {
    viewModel.emailController.dispose();
    viewModel.passwordController.dispose();
    super.onDispose(viewModel);
  }

  @override
  Widget builder(
      BuildContext context, SignUpViewModel viewModel, Widget? child) {
    // Get Screen Size of a Device
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      resizeToAvoidBottomInset: false,
      appBar: whiteAppBar(
        backArrow: false,
        showLogo: false,
        title: title,
        width: width,
        navigationService: viewModel.navigationService,
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: width * 0.05, top: height * 0.02, right: width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and Description
            _SignUPTexts(
              width: width,
              height: height,
            ),
            // For Spacing
            SizedBox(
              height: height * 0.02,
            ),
            // Authentication Text Form Fields
            _AuthFields(
              width: width,
              height: height,
            ),
            // For Spacing
            SizedBox(
              height: height * 0.015,
            ),
            // Privacy Policies
            _PrivacyPolicy(
              width: width,
              height: height,
            ),
            // For Spacing
            SizedBox(
              height: height * 0.02,
            ),
            // Log in Navigation
            _AlreadyAccount(
              width: width,
              height: height,
            ),
            // For Spacing
            SizedBox(
              height: height * 0.02,
            ),
            // Other Authentication Methods like Google
            _OtherAuthMethods(
              width: width,
              height: height,
              googleAuth: () => viewModel.authService.googleAuth(),
            ),
            // For Spacing
            SizedBox(
              height: height * 0.04,
            ),
            // Continue Button
            CustomElevatedButton(
              width: width,
              height: height,
              text: buttonText,
              showLoading: viewModel.showLoading,
              elevation: true,
              onPressed: () => viewModel.continueButtonFunction(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  SignUpViewModel viewModelBuilder(BuildContext context) => SignUpViewModel();
}

class _SignUPTexts extends StatelessWidget {
  final double width, height;
  const _SignUPTexts({required this.width, required this.height});

  // Variables
  final String title = "Hello there 👋";
  final String description =
      "Please enter your email & password to create an account";

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
            fontSize: width * 0.08,
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

class _AuthFields extends ViewModelWidget<SignUpViewModel> {
  final double width, height;
  const _AuthFields({required this.width, required this.height});

  // Variables
  final String emailText = "Email";
  final String passwordText = "Password";

  @override
  Widget build(BuildContext context, SignUpViewModel viewModel) {
    return Form(
      key: viewModel.formKey,
      child: Column(
        children: [
          // Email
          CustomTextFormField(
            controller: viewModel.emailController,
            title: emailText,
            hintText: emailText,
            icon: IconsPath.email,
            iconSize: width * 0.06,
            showIcon: true,
            validate: (value) => viewModel.validateEmail(value),
            onPressed: () {},
          ),
          // For Spacing
          SizedBox(
            height: height * 0.03,
          ),
          // Password
          CustomTextFormField(
            controller: viewModel.passwordController,
            title: passwordText,
            hintText: passwordText,
            obscureText: !viewModel.isShow,
            showIcon: true,
            icon: viewModel.isShow ? IconsPath.darkMode : IconsPath.unshow,
            iconSize: viewModel.isShow ? width * 0.09 : width * 0.06,
            validate: (value) => viewModel.validatePassword(value),
            onPressed: () {
              viewModel.iconToggle();
            },
          ),
        ],
      ),
    );
  }
}

class _PrivacyPolicy extends ViewModelWidget<SignUpViewModel> {
  final double width, height;
  const _PrivacyPolicy({required this.width, required this.height});

  // Variables
  final String title = "I agree to Chatty AI ";
  final String policiesText = "Public Agreement, Terms, & Privacy Policies";

  @override
  Widget build(BuildContext context, SignUpViewModel viewModel) {
    return Row(
      children: [
        // To Adjust Size of Check Box
        Transform.scale(
          scale: width * 0.0035,
          alignment: Alignment.centerRight,
          child: Checkbox(
            value: viewModel.isCheck,
            onChanged: (value) => viewModel.checkToggle(value),
            activeColor: AppColors.primary,
            side: BorderSide(
              color: viewModel.isErrorOnCheck
                  ? AppColors.primaryRed
                  : AppColors.primary,
              width: width * 0.004,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width * 0.013),
            ),
          ),
        ),
        // Multiple Colors Texts
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                // Title
                TextSpan(
                  text: title,
                  style: TextStyle(
                    color: AppColors.primaryBlack,
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // Policies
                TextSpan(
                  text: policiesText,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _AlreadyAccount extends ViewModelWidget<SignUpViewModel> {
  final double width, height;
  const _AlreadyAccount({required this.width, required this.height});

  // Variables
  final String title = "Already have an account? ";
  final String loginText = "Log in";

  @override
  Widget build(BuildContext context, SignUpViewModel viewModel) {
    return Column(
      children: [
        // For Spacing
        SizedBox(
          height: height * 0.03,
        ),
        // Texts
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Main Title
            Text(
              title,
              style: TextStyle(
                color: AppColors.primaryBlack,
                fontSize: width * 0.045,
                fontWeight: FontWeight.w500,
              ),
            ),
            // Login Text
            InkWell(
              onTap: () => viewModel.navigationService.replaceWithLoginView(),
              child: Text(
                loginText,
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _OtherAuthMethods extends StatelessWidget {
  final double width, height;
  final void Function() googleAuth;
  const _OtherAuthMethods(
      {required this.width, required this.height, required this.googleAuth});

  // Variables
  final String title = "or continue with";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1st Line
            Container(
              color: AppColors.black60,
              width: width * 0.25,
              height: height * 0.0002,
            ),
            // For Spacing
            SizedBox(
              width: width * 0.02,
            ),
            // Main Text
            Text(
              title,
              style: TextStyle(
                color: AppColors.black60,
                fontSize: width * 0.04,
                fontWeight: FontWeight.w500,
              ),
            ),
            // For Spacing
            SizedBox(
              width: width * 0.02,
            ),
            // 2nd Line
            Container(
              color: AppColors.black60,
              width: width * 0.25,
              height: height * 0.0002,
            ),
          ],
        ),
        // For Spacing
        SizedBox(
          height: height * 0.05,
        ),
        // Google Auth
        InkWell(
          onTap: () => googleAuth(),
          borderRadius: BorderRadius.circular(width),
          child: Container(
            width: width * 0.9,
            height: height * 0.065,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primaryBlack,
                width: width * 0.001,
              ),
              borderRadius: BorderRadius.circular(width),
            ),
            child: UnconstrainedBox(
              child: Row(
                children: [
                  // Icon
                  SvgPicture.asset(
                    IconsPath.google,
                    width: width * 0.07,
                  ),
                  // For Spacing
                  SizedBox(
                    width: width * 0.03,
                  ),
                  // Google Text
                  Text(
                    "Continue with Google",
                    style: TextStyle(
                      color: AppColors.primaryBlack,
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
