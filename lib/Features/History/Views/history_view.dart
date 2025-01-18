import 'package:chatty_ai/App/app.router.dart';
import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/icons_path.dart';
import 'package:chatty_ai/Features/History/Views/history_view_model.dart';
import 'package:chatty_ai/Widgets/white_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class HistoryView extends StackedView<HistoryViewModel> {
  const HistoryView({super.key});

  final String title = 'History';
  final String itemTitle = "I weigh 80 kg. I want a diet plan to lose weight.";
  final String bottomSheetTitle = "Clear All History";
  final String bottomSheetDescription =
      "Are you sure you want to clear all history?";
  final String cancelButtonTitle = "Cancel";
  final String confirmButtonText = "Yes, Clear All History";

  @override
  Widget builder(
      BuildContext context, HistoryViewModel viewModel, Widget? child) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      appBar: whiteAppBar(
        title: title,
        width: width,
        backArrow: false,
        actions: [
          InkWell(
            onTap: () => viewModel.navigationService.navigateToSearchView(),
            child: SvgPicture.asset(IconsPath.search),
          ),
          SizedBox(
            width: width * 0.06,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(width),
            onTap: () {
              viewModel.bottomSheet(
                context: context,
                title: bottomSheetTitle,
                description: bottomSheetDescription,
                cancelTitle: cancelButtonTitle,
                confirmTitle: confirmButtonText,
              );
            },
            child: SvgPicture.asset(IconsPath.delete),
          ),
          SizedBox(
            width: width * 0.04,
          ),
        ],
      ),
      body: Container(
        width: width,
        height: height,
        padding: EdgeInsets.only(top: height * 0.02),
        child: Column(
          children: [
            _HistoryItems(
              width: width,
              height: height,
              title: itemTitle,
            ),
            _HistoryItems(
              width: width,
              height: height,
              title: itemTitle,
            ),
            _HistoryItems(
              width: width,
              height: height,
              title: itemTitle,
            ),
          ],
        ),
      ),
    );
  }

  @override
  HistoryViewModel viewModelBuilder(BuildContext context) => HistoryViewModel();
}

class _HistoryItems extends ViewModelWidget<HistoryViewModel> {
  final double width, height;
  final String title;
  const _HistoryItems(
      {required this.title, required this.width, required this.height});

  @override
  Widget build(BuildContext context, HistoryViewModel viewModel) {
    // Container for Background Color
    return Container(
      width: width * 0.9,
      height: height * 0.09,
      margin: EdgeInsets.symmetric(vertical: height * 0.005),
      decoration: BoxDecoration(
        color: AppColors.black40,
        borderRadius: BorderRadius.circular(width * 0.04),
      ),
      child: Row(
        children: [
          // Padding for Left Spacing of Elements
          Padding(
            padding: EdgeInsets.only(left: width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Main title means Query of User
                Text(
                  title.length > 35 ? "${title.substring(0, 35)}..." : title,
                  style: TextStyle(
                    fontSize: width * 0.045,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryBlack,
                  ),
                ),
                // For Spacing
                SizedBox(
                  height: height * 0.006,
                ),
                // Main Sutitle means Data and Time
                Text(
                  "17 Jan 2015 - 10:30 AM",
                  style: TextStyle(
                    fontSize: width * 0.031,
                    color: AppColors.black60,
                  ),
                ),
              ],
            ),
          ),
          // For Spacing
          SizedBox(
            width: width * 0.02,
          ),
          // Right Arrow For Navigation Details View
          Center(child: SvgPicture.asset(IconsPath.rightArrow)),
        ],
      ),
    );
  }
}
