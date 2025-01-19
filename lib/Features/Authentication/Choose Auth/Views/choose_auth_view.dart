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
          ),
        ],
      ),
    );
  }

  @override
  ChooseAuthViewModel viewModelBuilder(BuildContext context) =>
      ChooseAuthViewModel();
}

class _AuthMethods extends StatelessWidget {
  final double width, height;
  const _AuthMethods({required this.width, required this.height});

  final String title = "Welcome to";
  final String appName = "Chatty AI 👋";
  final String login = "Log in";
  final String signUp = "Sign up";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // App Logo
        Center(
          child: SvgPicture.asset(
            IconsPath.appLogo,
            width: width * 0.4,
            height: width * 0.4,
          ),
        ),
        // For Spacing
        SizedBox(height: height * 0.06),
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
        SizedBox(height: height * 0.06),
        // Login
        CustomElevatedButton(
          width: width * 0.9,
          text: login,
          height: height,
          elevation: false,
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
        ),
      ],
    );
  }
}

class _Dividing extends StatelessWidget {
  final double width, height;
  const _Dividing({required this.width, required this.height});

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
  _OtherAuthMethods({required this.width, required this.height});

  final List<String> icons = [
    IconsPath.google,
    IconsPath.facebook,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        icons.length,
        (index) {
          // Border of Icons
          return Container(
            width: width * 0.4,
            height: height * 0.06,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primaryBlack,
                width: width * 0.001,
              ),
              borderRadius: BorderRadius.circular(width),
            ),
            // Icon
            child: UnconstrainedBox(
              child: SvgPicture.asset(
                icons[index],
                width: width * 0.07,
              ),
            ),
          );
        },
      ),
    );
  }
}
