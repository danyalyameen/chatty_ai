import 'package:chatty_ai/App/app.router.dart';
import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/icons_path.dart';
import 'package:chatty_ai/Features/History/Views/history_view_model.dart';
import 'package:chatty_ai/Models/user_model.dart';
import 'package:chatty_ai/Widgets/custom_bottom_sheet.dart';
import 'package:chatty_ai/Widgets/white_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

class HistoryView extends StackedView<HistoryViewModel> {
  const HistoryView({super.key});

  // Variables
  final String title = 'History';
  final String bottomSheetTitle = "Clear All History";
  final String bottomSheetDescription =
      "Are you sure you want to clear all history?";
  final String cancelButtonTitle = "Cancel";
  final String confirmButtonText = "Yes, Clear All History";

  @override
  Widget builder(
      BuildContext context, HistoryViewModel viewModel, Widget? child) {
    // Get Screen Size of a Device
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      appBar: whiteAppBar(
        title: title,
        width: width,
        backArrow: false,
        actions: [
          // Search View Icon
          InkWell(
            onTap: () => viewModel.navigationService.navigateToSearchView(),
            child: SvgPicture.asset(IconsPath.search),
          ),
          // For Spacing
          SizedBox(
            width: width * 0.06,
          ),
          // Clear All History
          InkWell(
            borderRadius: BorderRadius.circular(width),
            onTap: () {
              CustomBottomSheet.bottomSheet(
                context: context,
                title: bottomSheetTitle,
                description: bottomSheetDescription,
                cancelTitle: cancelButtonTitle,
                confirmTitle: confirmButtonText,
                onPressed: () {
                  viewModel.deleteAllChats();
                },
              );
            },
            child: SvgPicture.asset(IconsPath.delete),
          ),
          // For Right Spacing
          SizedBox(
            width: width * 0.04,
          ),
        ],
      ),
      body: Container(
        width: width,
        height: height * 0.8,
        padding: EdgeInsets.only(top: height * 0.02),
        child: _HistoryItems(
          width: width,
          height: height,
        ),
      ),
    );
  }

  @override
  HistoryViewModel viewModelBuilder(BuildContext context) => HistoryViewModel();
}

class _HistoryItems extends ViewModelWidget<HistoryViewModel> {
  final double width, height;
  const _HistoryItems({required this.width, required this.height});

  @override
  Widget build(BuildContext context, HistoryViewModel viewModel) {
    // Container for Background Color
    return FutureBuilder<List<Chats>>(
      future: viewModel.firestoreService.getChat(),
      builder: (context, snapshot) {
        // Loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            children: List.generate(
              7,
              (index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: width * 0.9,
                    height: height * 0.09,
                    margin: EdgeInsets.symmetric(vertical: height * 0.005),
                    decoration: BoxDecoration(
                      color: AppColors.black40,
                      borderRadius: BorderRadius.circular(width * 0.04),
                    ),
                  ),
                );
              },
            ),
          );
        }
        if (snapshot.data!.isEmpty) {
          // No Chats Found
          return Center(
            child: Text(
              "No Chats Found",
              style: TextStyle(
                color: AppColors.primaryBlack,
                fontSize: width * 0.05,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }
        final chats = snapshot.data;
        return ListView.builder(
          itemCount: chats!.length,
          itemBuilder: (context, index) {
            // Format Date
            final date = DateFormat("dd MMMM yyyy");
            final time = chats[index].timestamp!.toDate();
            return InkWell(
              borderRadius: BorderRadius.circular(width * 0.04),
              onTap: () {
                viewModel.navigationService
                    .navigateToPreviousChatView(messages: chats[index].chat!);
              },
              onLongPress: () {
                CustomBottomSheet.bottomSheet(
                  context: context,
                  title: "Delete Chat",
                  description: "Are you sure you want to delete this chat?",
                  cancelTitle: "Cancel",
                  confirmTitle: "Confirm",
                  onPressed: () async {
                    viewModel.deleteChat(index: index);
                  },
                );
              },
              child: Container(
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
                            chats[index].title!.length > 35
                                ? "${chats[index].title!.substring(0, 35)}..."
                                : chats[index].title!,
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
                          // Time
                          Text(
                            "${date.format(time)} - ${time.hour < 12 ? time.hour.toString().padLeft(2, "0") : ((time.hour - 12).toString().padLeft(2, "0"))}:${time.minute.toString().padLeft(2, "0")} ${time.hour > 12 ? "PM" : "AM"}",
                            style: TextStyle(
                              fontSize: width * 0.031,
                              color: AppColors.black60,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // For Spacing
                    const Spacer(),
                    // Right Arrow For Navigation Details View
                    Padding(
                      padding: EdgeInsets.only(right: width * 0.04),
                      child:
                          Center(child: SvgPicture.asset(IconsPath.rightArrow)),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
