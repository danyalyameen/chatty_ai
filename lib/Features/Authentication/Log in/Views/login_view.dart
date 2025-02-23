import 'package:chatty_ai/App/app.router.dart';
import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/icons_path.dart';
import 'package:chatty_ai/Features/Authentication/Log%20in/Views/login_view_model.dart';
import 'package:chatty_ai/Widgets/custom_elevated_button.dart';
import 'package:chatty_ai/Widgets/custom_text_form_field.dart';
import 'package:chatty_ai/Widgets/white_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({super.key});

  // Variables
  final String title = "Login";
  final String buttonText = "Continue";

  @override
  Widget builder(
      BuildContext context, LoginViewModel viewModel, Widget? child) {
    // Get Screen Size of Device
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
            _LoginTexts(
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
              height: height,
            ),
            // For Spacing
            SizedBox(
              height: height * 0.04,
            ),
            // Log in Navigation
            _NoHaveAccount(
              width: width,
              height: height,
            ),
            // For Spacing
            SizedBox(
              height: height * 0.04,
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
              text: buttonText,
              showLoading: viewModel.showLoading,
              height: height,
              elevation: true,
              onPressed: () => viewModel.continueButtonFunction(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}

class _LoginTexts extends StatelessWidget {
  final double width, height;
  const _LoginTexts({required this.width, required this.height});

  // Variables
  final String title = "Welcome back 👋";
  final String description = "Please enter your email & password to log in.";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          title,
          style: TextStyle(
            color: AppColors.textColor,
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
            color: AppColors.textColor,
            fontWeight: FontWeight.w300,
            fontSize: width * 0.042,
          ),
        )
      ],
    );
  }
}

class _AuthFields extends ViewModelWidget<LoginViewModel> {
  final double width, height;
  const _AuthFields({required this.width, required this.height});

  // Variables
  final String emailText = "Email";
  final String passwordText = "Password";

  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
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
            onPressed: () {},
            validate: (value) => viewModel.validateEmail(value),
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

class _NoHaveAccount extends ViewModelWidget<LoginViewModel> {
  final double width, height;
  const _NoHaveAccount({required this.width, required this.height});

  // Variables
  final String forgotPasswordText = "Forgot Password?";
  final String title = "Don't have an account? ";
  final String signUpText = "Sign up";

  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return Column(
      children: [
        // Line
        Container(
          color: AppColors.black60,
          width: width * 0.83,
          height: height * 0.0002,
        ),
        // For Spacing
        SizedBox(
          height: height * 0.02,
        ),
        InkWell(
          onTap: () => viewModel.navigationService
              .navigateToForgotPasswordView(title: "Forgot Password"),
          child: Text(
            forgotPasswordText,
            style: TextStyle(
              color: AppColors.primary,
              fontSize: width * 0.045,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        // For Spacing
        SizedBox(
          height: height * 0.02,
        ),
        // Texts
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Main Title
            Text(
              title,
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: width * 0.045,
                fontWeight: FontWeight.w500,
              ),
            ),
            // Login Text
            InkWell(
              onTap: () => viewModel.navigationService.replaceWithSignUpView(),
              child: Text(
                signUpText,
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
        InkWell(
          onTap: () => googleAuth(),
          borderRadius: BorderRadius.circular(width),
          child: Container(
            width: width * 0.9,
            height: height * 0.065,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.textColor,
                width: width * 0.001,
              ),
              borderRadius: BorderRadius.circular(width),
            ),
            // Icon
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
                      color: AppColors.textColor,
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
