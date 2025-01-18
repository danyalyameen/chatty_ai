import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/icons_path.dart';
import 'package:chatty_ai/Features/AI%20Assistants/Views/ai_assistants_view_model.dart';
import 'package:chatty_ai/Widgets/white_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class AIAssistantsView extends StackedView<AIAssistantsViewModel> {
  const AIAssistantsView({super.key});

  final String title = 'AI Assistants';

  @override
  Widget builder(
      BuildContext context, AIAssistantsViewModel viewModel, Widget? child) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      appBar: whiteAppBar(
        title: title,
        width: width,
        backArrow: false,
      ),
      body: Column(
        children: [
          _FilterCategory(
            width: width,
            height: height,
          ),
          SizedBox(height: height * 0.02),
          _AIAssistantItemsList(
            icon: IconsPath.historyOutline,
            iconBackgroundColor: Colors.green,
            title: "Songs/Lyrics",
            description: "Generate Lyrics from any Music genre you want.",
            width: width,
            height: height,
          ),
        ],
      ),
    );
  }

  @override
  AIAssistantsViewModel viewModelBuilder(BuildContext context) =>
      AIAssistantsViewModel();
}

class _FilterCategory extends ViewModelWidget<AIAssistantsViewModel> {
  final double width, height;
  const _FilterCategory({required this.width, required this.height});

  @override
  Widget build(BuildContext context, AIAssistantsViewModel viewModel) {
    // Fixed Size of ListView.builder()
    return Container(
      width: width,
      height: height * 0.05,
      padding: EdgeInsets.only(top: height * 0.01),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: viewModel.filterList.length,
        itemBuilder: (context, index) {
          // Filter Item
          return Padding(
            padding: EdgeInsets.only(left: width * 0.03),
            child: InkWell(
              borderRadius: BorderRadius.circular(width),
              onTap: () {
                viewModel.updateSelectedIndex(index);
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03,
                  vertical: height * 0.005,
                ),
                decoration: BoxDecoration(
                  color: viewModel.selectedIndex == index
                      ? AppColors.primary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.primary,
                    width: width * 0.006,
                  ),
                ),
                child: Text(
                  viewModel.filterList[index],
                  style: TextStyle(
                    color: viewModel.selectedIndex == index
                        ? AppColors.primaryLight
                        : AppColors.primary,
                    fontSize: width * 0.04,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AIAssistantItemsList extends ViewModelWidget<AIAssistantsViewModel> {
  final double width, height;
  final String icon;
  final Color iconBackgroundColor;
  final String title;
  final String description;
  const _AIAssistantItemsList(
      {required this.icon,
      required this.iconBackgroundColor,
      required this.title,
      required this.description,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context, AIAssistantsViewModel viewModel) {
    // Background Color Container
    return Container(
      width: width * 0.445,
      height: height * 0.24,
      decoration: BoxDecoration(
        color: AppColors.black40,
        borderRadius: BorderRadius.circular(width * 0.06),
      ),
      padding: EdgeInsets.only(left: width * 0.06, right: width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon Container
          Container(
            width: width * 0.16,
            height: width * 0.16,
            margin: EdgeInsets.only(top: height * 0.02),
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: BorderRadius.circular(width * 0.05),
            ),
            child: Center(
              // Icon
              child: SvgPicture.asset(
                icon,
                width: width * 0.1,
                height: width * 0.1,
                colorFilter: ColorFilter.mode(Colors.yellow, BlendMode.srcIn),
              ),
            ),
          ),
          // For Spacing
          SizedBox(height: height * 0.018),
          // Title and Description
          Text(
            title,
            style: TextStyle(
              color: AppColors.primaryBlack,
              fontSize: width * 0.042,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: height * 0.008),
          Text(
            description,
            style: TextStyle(
              color: AppColors.black60,
              fontSize: width * 0.035,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
