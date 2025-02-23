import 'package:chatty_ai/App/app.router.dart';
import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/icons_path.dart';
import 'package:chatty_ai/Features/Authentication/Choose%20Auth/Views/choose_auth_view_model.dart';
import 'package:chatty_ai/Widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

class ChooseAuthView extends StackedView<ChooseAuthViewModel> {
  const ChooseAuthView({super.key});

  @override
  Widget builder(
      BuildContext context, ChooseAuthViewModel viewModel, Widget? child) {
    // Get Screen Size of a Device
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Main Authentication Methods
          _AuthMethods(
            width: width,
            height: height,
          ),
          // For Spacing
          SizedBox(
            height: height * 0.05,
          ),
          // Or Continue Text
          _Dividing(
            width: width,
            height: height,
          ),
          // For Spacing
          SizedBox(
            height: height * 0.05,
          ),
          // Other Authentication Methods like Google
          _OtherAuthMethods(
            width: width,
            height: height,
            googleAuth: () => viewModel.authService.googleAuth(),
          ),
        ],
      ),
    );
  }

  @override
  ChooseAuthViewModel viewModelBuilder(BuildContext context) =>
      ChooseAuthViewModel();
}

class _AuthMethods extends ViewModelWidget<ChooseAuthViewModel> {
  final double width, height;
  const _AuthMethods({required this.width, required this.height});

  // Variables
  final String title = "Welcome to";
  final String appName = "Chatty AI 👋";
  final String login = "Log in";
  final String signUp = "Sign up";

  @override
  Widget build(BuildContext context, ChooseAuthViewModel viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // App Logo
        Center(
          child: SvgPicture.asset(
            IconsPath.appLogo,
            width: width * 0.66,
            height: width * 0.66,
          ),
        ),
        // Title
        Text(
          title,
          style: TextStyle(
            color: AppColors.primaryBlack,
            fontSize: width * 0.11,
            fontWeight: FontWeight.w700,
          ),
        ),
        // App Name Title
        Text(
          appName,
          style: TextStyle(
            color: AppColors.primary,
            fontSize: width * 0.1,
            fontWeight: FontWeight.w700,
          ),
        ),
        // For Spacing
        SizedBox(height: height * 0.04),
        // Login
        CustomElevatedButton(
          width: width * 0.9,
          text: login,
          height: height,
          elevation: false,
          onPressed: () => viewModel.navigationService.navigateToLoginView(),
        ),
        // For Spacing
        SizedBox(
          height: height * 0.02,
        ),
        // Sign UP
        CustomElevatedButton(
          width: width * 0.9,
          text: signUp,
          height: height,
          elevation: false,
          backgroundColor: AppColors.primary60,
          textColor: AppColors.primary,
          onPressed: () => viewModel.navigationService.navigateToSignUpView(),
        ),
      ],
    );
  }
}

class _Dividing extends StatelessWidget {
  final double width, height;
  const _Dividing({required this.width, required this.height});

  // Variables
  final String title = "or continue with";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 1st Line
          Container(
            color: AppColors.black60,
            width: width * 0.25,
            height: height * 0.001,
          ),
          // For Spacing
          SizedBox(
            width: width * 0.02,
          ),
          // Main Text
          Text(
            title,
            style: TextStyle(
              color: AppColors.black80,
              fontSize: width * 0.04,
              fontWeight: FontWeight.w600,
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
            height: height * 0.001,
          ),
        ],
      ),
    );
  }
}

class _OtherAuthMethods extends StatelessWidget {
  final double width, height;
  final void Function() googleAuth;
  const _OtherAuthMethods(
      {required this.width, required this.height, required this.googleAuth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                  color: AppColors.primaryBlack,
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
