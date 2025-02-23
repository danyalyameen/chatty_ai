import 'package:chatty_ai/App/app.router.dart';
import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/icons_path.dart';
import 'package:chatty_ai/Features/Account/View/account_view_model.dart';
import 'package:chatty_ai/Widgets/custom_bottom_sheet.dart';
import 'package:chatty_ai/Widgets/white_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

class AccountView extends StackedView<AccountViewModel> {
  const AccountView({super.key});

  // Variables
  final String title = 'Account';

  @override
  Widget builder(
      BuildContext context, AccountViewModel viewModel, Widget? child) {
    // Get Screen Size of a Device
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      appBar: whiteAppBar(backArrow: false, title: title, width: width),
      body: Column(
        children: [
          // Profile Section
          _Profile(
            width: width,
            height: height,
          ),
          // General Options
          _GeneralOptions(
            width: width,
            height: height,
            dob: viewModel.dob,
            gender: viewModel.gender,
            name: viewModel.name,
          ),
        ],
      ),
    );
  }

  @override
  AccountViewModel viewModelBuilder(BuildContext context) => AccountViewModel();
}

class _Profile extends ViewModelWidget<AccountViewModel> {
  final double width, height;
  const _Profile({required this.width, required this.height});

  @override
  Widget build(BuildContext context, AccountViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.01),
      child: FutureBuilder(
        future: viewModel.firestoreService.getUserInfo(),
        builder: (context, snapshot) {
          // Loading State
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: width * 0.9,
                height: height * 0.12,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(width * 0.04),
                ),
              ),
            );
          }
          final userInfo = snapshot.data!;
          viewModel.name = userInfo.name!;
          viewModel.gender = userInfo.gender!;
          viewModel.dob = userInfo.dob!.toDate();
          return InkWell(
            onTap: () async {
              await viewModel.navigationService.navigateToProfileInfo(
                dob: userInfo.dob!.toDate(),
                gender: userInfo.gender!,
                name: userInfo.name!,
              );
              viewModel.notifyListeners();
            },
            child: Container(
              width: width * 0.9,
              height: height * 0.12,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(width * 0.04),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // User Image
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.04),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // White Background
                        Container(
                          width: width * 0.21,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryLight,
                          ),
                        ),
                        // Make Outline Transparent
                        Container(
                          width: width * 0.195,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary,
                          ),
                        ),
                        // user Image
                        ValueListenableBuilder(
                          valueListenable: viewModel.imageError,
                          builder: (context, value, child) {
                            return CircleAvatar(
                              radius: width * 0.09,
                              backgroundImage: NetworkImage(
                                viewModel.imageService.getUserImage(),
                              ),
                              backgroundColor:
                                  value ? Colors.teal : Colors.transparent,
                              onBackgroundImageError: (exception, stackTrace) {
                                viewModel.imageError.value = true;
                              },
                              child: value
                                  ? Center(
                                      child: Text(
                                        userInfo.name!.substring(0, 1),
                                        style: TextStyle(
                                          color: AppColors.primaryLight,
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * 0.09,
                                        ),
                                      ),
                                    )
                                  : null,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  // User Name and Email
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.03, right: width * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // User Name
                        Text(
                          userInfo.name!,
                          style: TextStyle(
                            color: AppColors.grey,
                            fontSize: width * 0.055,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // For Spacing
                        SizedBox(
                          height: height * 0.005,
                        ),
                        // User Email
                        Text(
                          viewModel.authService.getUser()!.email!.length > 14
                              ? "${viewModel.authService.getUser()!.email!.substring(0, 14)}..."
                              : viewModel.authService.getUser()!.email!,
                          style: TextStyle(
                            color: AppColors.grey,
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                  // For Spacing
                  const Spacer(),
                  // Right Arrow
                  SvgPicture.asset(
                    IconsPath.rightArrow,
                    colorFilter: ColorFilter.mode(
                        AppColors.primaryLight, BlendMode.srcIn),
                  ),
                  // For Spacing
                  SizedBox(
                    width: width * 0.04,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _GeneralOptions extends ViewModelWidget<AccountViewModel> {
  final double width, height;
  final String name, gender;
  final DateTime dob;
  const _GeneralOptions(
      {required this.width,
      required this.height,
      required this.name,
      required this.gender,
      required this.dob});

  // Variables
  final String generalTitle = "General";
  final String logoutTitle = "Logout";
  final String bottomSheetTitle = "Logout";
  final String bottomSheetDescription = "Are you sure you want to log out?";
  final String cancelButtonText = "Cancel";
  final String confirmButtonText = "Yes, Logout";

  @override
  Widget build(BuildContext context, AccountViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.only(
          left: width * 0.05, top: height * 0.02, right: width * 0.04),
      child: Column(
        children: [
          // General Title
          Row(
            children: [
              // Text
              Text(
                generalTitle,
                style: TextStyle(color: AppColors.grey80),
              ),
              // For Spacing
              SizedBox(
                width: width * 0.02,
              ),
              // Line
              Container(
                width: width * 0.75,
                height: height * 0.0002,
                color: AppColors.grey80,
              ),
            ],
          ),
          // For Spacing
          SizedBox(
            height: height * 0.01,
          ),
          // General Options
          InkWell(
            onTap: () => viewModel.navigationService.navigateToProfileInfo(
              name: name,
              gender: gender,
              dob: dob,
            ),
            child: Padding(
              padding: EdgeInsets.all(width * 0.02),
              child: Row(
                children: [
                  // Icon
                  Center(
                    child: SvgPicture.asset(IconsPath.accountOutline,
                        width: width * 0.06),
                  ),
                  // For Spacing
                  SizedBox(
                    width: width * 0.05,
                  ),
                  // Title
                  Text(
                    "Profile Info",
                    style: TextStyle(
                      color: AppColors.primaryBlack,
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  // For Spacing
                  const Spacer(),
                  // Right Arrow
                  SvgPicture.asset(IconsPath.rightArrow),
                ],
              ),
            ),
          ),
          // Logout
          InkWell(
            borderRadius: BorderRadius.circular(width * 0.04),
            onTap: () {
              CustomBottomSheet.bottomSheet(
                context: context,
                title: bottomSheetTitle,
                description: bottomSheetDescription,
                cancelTitle: cancelButtonText,
                confirmTitle: confirmButtonText,
                sheetHeight: height * 0.28,
                titleStyle: TextStyle(
                  fontSize: width * 0.055,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryRed,
                ),
                onPressed: () {
                  viewModel.authService.logout();
                },
              );
            },
            child: Padding(
              padding: EdgeInsets.all(width * 0.02),
              child: Row(
                children: [
                  // Logout Icon
                  Center(
                    child: SvgPicture.asset(
                      IconsPath.logout,
                      width: width * 0.074,
                      colorFilter: ColorFilter.mode(
                          AppColors.primaryRed, BlendMode.srcIn),
                    ),
                  ),
                  // For Spacing
                  SizedBox(
                    width: width * 0.05,
                  ),
                  // Logout Title
                  Text(
                    logoutTitle,
                    style: TextStyle(
                      color: AppColors.primaryRed,
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
