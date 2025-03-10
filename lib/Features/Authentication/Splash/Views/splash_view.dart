import 'dart:async';

import 'package:chatty_ai/App/app.router.dart';
import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/constants.dart';
import 'package:chatty_ai/Constants/icons_path.dart';
import 'package:chatty_ai/Features/Authentication/Splash/Views/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StackedView<SplashViewModel> {
  const SplashView({super.key});

  @override
  void onViewModelReady(SplashViewModel viewModel) async {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    super.onViewModelReady(viewModel);
    // Delay for 3 Seconds
    await Future.delayed(const Duration(seconds: 3));
    // Get Shared Preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Navigation
    if (sharedPreferences.getBool(Constants.loggedIn) == true) {
      viewModel.navigationService.replaceWithChatView();
    } else {
      viewModel.navigationService.replaceWithChooseAuthView();
    }
  }

  @override
  Widget builder(
      BuildContext context, SplashViewModel viewModel, Widget? child) {
    // Get Screen Size of a Device
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
              width: width * 0.8,
            ),
          ),
          // For Spacing
          SizedBox(
            height: height * 0.06,
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
