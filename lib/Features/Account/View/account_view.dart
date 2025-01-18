import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/icons_path.dart';
import 'package:chatty_ai/Constants/images_path.dart';
import 'package:chatty_ai/Features/Account/View/account_view_model.dart';
import 'package:chatty_ai/Widgets/custom_switch_tile.dart';
import 'package:chatty_ai/Widgets/white_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class AccountView extends StackedView<AccountViewModel> {
  const AccountView({super.key});

  final String title = 'Account';

  @override
  Widget builder(
      BuildContext context, AccountViewModel viewModel, Widget? child) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: whiteAppBar(backArrow: false, title: title, width: width),
      body: Column(
        children: [
          _Profile(
            width: width,
            height: height,
          ),
          _GeneralOptions(
            width: width,
            height: height,
          ),
        ],
      ),
    );
  }

  @override
  AccountViewModel viewModelBuilder(BuildContext context) => AccountViewModel();
}

class _Profile extends StatelessWidget {
  final double width, height;
  const _Profile({required this.width, required this.height});

  final String userName = "Andrew Ainslay";
  final String userEmail = "andrewainslay@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // User Image
          CircleAvatar(
            radius: width * 0.09,
            backgroundImage: const AssetImage(ImagesPath.userImage),
          ),
          // User Name and Email
          Padding(
            padding: EdgeInsets.only(left: width * 0.035, right: width * 0.12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User Name
                Text(
                  userName,
                  style: TextStyle(
                    color: AppColors.primaryBlack,
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
                  userEmail,
                  style: TextStyle(
                    color: AppColors.primaryBlack,
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
          ),
          // Right Arrow
          SvgPicture.asset(IconsPath.rightArrow),
        ],
      ),
    );
  }
}

class _GeneralOptions extends ViewModelWidget<AccountViewModel> {
  final double width, height;
  _GeneralOptions({required this.width, required this.height});

  final String generalTitle = "General";
  final List<String> icons = [
    IconsPath.accountOutline,
    IconsPath.security,
  ];
  final List<String> titles = ["Personal Info", "Security"];
  final String logoutTitle = "Logout";

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
          SizedBox(
            height: height * 0.1,
            child: ListView.builder(
              itemCount: icons.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(width * 0.02),
                  child: Row(
                    children: [
                      // Icon
                      Center(
                        child:
                            SvgPicture.asset(icons[index], width: width * 0.06),
                      ),
                      // For Spacing
                      SizedBox(
                        width: width * 0.05,
                      ),
                      // Title
                      Text(
                        titles[index],
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
                );
              },
            ),
          ),
          // Custom Dark Mode Switch
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.01, vertical: width * 0.02),
            child: CustomSwitchTile(
              title: 'Dark Mode',
              width: width,
              isIcon: true,
              value: viewModel.isDarkMode,
              onChanged: (value) => viewModel.toggleDarkMode(value),
            ),
          ),
          // Logout
          Padding(
            padding: EdgeInsets.all(width * 0.02),
            child: Row(
              children: [
                Center(
                  child: SvgPicture.asset(
                    IconsPath.logout,
                    width: width * 0.074,
                    colorFilter:
                        ColorFilter.mode(AppColors.primaryRed, BlendMode.srcIn),
                  ),
                ),
                SizedBox(
                  width: width * 0.05,
                ),
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
          )
        ],
      ),
    );
  }
}
