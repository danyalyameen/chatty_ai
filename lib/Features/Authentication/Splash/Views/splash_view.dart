import 'dart:async';

import 'package:chatty_ai/App/app.router.dart';
import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/icons_path.dart';
import 'package:chatty_ai/Features/Authentication/Splash/Views/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StackedView<SplashViewModel> {
  const SplashView({super.key});

  @override
  void onViewModelReady(SplashViewModel viewModel) async {
    super.onViewModelReady(viewModel);
    // Timer
    await Future.delayed(const Duration(seconds: 3));
    // Navigation
    viewModel.navigationService.replaceWithChooseAuthView();
  }

  @override
  Widget builder(
      BuildContext context, SplashViewModel viewModel, Widget? child) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // App Logo
          UnconstrainedBox(
            child: SvgPicture.asset(
              IconsPath.appLogo,
              width: width * 0.6,
            ),
          ),
          // For Spacing
          SizedBox(
            height: height * 0.1,
          ),
          // Loader
          SpinKitFadingCircle(
            color: AppColors.primary,
            size: width * 0.1,
          )
        ],
      ),
    );
  }

  @override
  SplashViewModel viewModelBuilder(BuildContext context) => SplashViewModel();
}
