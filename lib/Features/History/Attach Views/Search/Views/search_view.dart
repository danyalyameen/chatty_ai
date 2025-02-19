import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/icons_path.dart';
import 'package:chatty_ai/Features/History/Attach%20Views/Search/Views/search_view_model.dart';
import 'package:chatty_ai/Widgets/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class SearchView extends StackedView<SearchViewModel> {
  const SearchView({super.key});

  @override
  void onViewModelReady(SearchViewModel viewModel) {
    viewModel.getChats();
    viewModel.searchController.addListener(viewModel.getSearchResults);
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
      BuildContext context, SearchViewModel viewModel, Widget? child) {
    // Get Screen Size of a Device
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Search Bar
          _SearchBar(
            width: width,
            height: height,
          ),
          // Result
          _SearchResults(width: width, height: height),
        ],
      ),
    );
  }

  @override
  SearchViewModel viewModelBuilder(BuildContext context) => SearchViewModel();
}

class _SearchBar extends ViewModelWidget<SearchViewModel> {
  final double width, height;
  const _SearchBar({required this.width, required this.height});

  @override
  Widget build(BuildContext context, SearchViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.only(
        top: height * 0.04,
      ),
      child: Row(
        children: [
          // Back Button
          Padding(
            padding: EdgeInsets.all(width * 0.04),
            child: Center(
              child: InkWell(
                borderRadius: BorderRadius.circular(width),
                onTap: () => viewModel.navigationService.back(),
                child: SvgPicture.asset(
                  IconsPath.backArrow,
                  width: width * 0.04,
                  height: height * 0.04,
                ),
              ),
            ),
          ),
          // Search Text Field
          Center(
            child: Container(
              height: height * 0.06,
              width: width * 0.74,
              margin: EdgeInsets.only(right: width * 0.04),
              decoration: BoxDecoration(
                color: viewModel.searchNode.hasFocus
                    ? AppColors.primary40
                    : AppColors.grey,
                borderRadius: BorderRadius.circular(width * 0.04),
              ),
              child: TextField(
                focusNode: viewModel.searchNode,
                controller: viewModel.searchController,
                autofocus: true,
                style: TextStyle(
                  color: AppColors.primaryBlack,
                  fontSize: width * 0.05,
                ),
                cursorHeight: height * 0.025,
                // textAlign: TextAlign.left,
                textAlignVertical: TextAlignVertical(y: 0.6),
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: width * 0.05,
                  ),
                  prefixIcon: UnconstrainedBox(
                    child: SvgPicture.asset(
                      IconsPath.search,
                      width: width * 0.055,
                      height: width * 0.055,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(width * 0.04),
                    borderSide: BorderSide(
                      color: AppColors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(width * 0.04),
                    borderSide: BorderSide(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchResults extends ViewModelWidget<SearchViewModel> {
  final double width, height;
  const _SearchResults({required this.width, required this.height});
  @override
  Widget build(BuildContext context, SearchViewModel viewModel) {
    return SizedBox(
      width: width,
      height: height * 0.8,
      child: viewModel.searchResults.isEmpty
          ? Center(
              child: Text(
                "No Chats Found",
                style: TextStyle(
                  color: AppColors.primaryBlack,
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          : ListView.builder(
              itemCount: viewModel.searchResults.length,
              itemBuilder: (context, index) {
                final chats = viewModel.searchResults;
                // Format Date
                final date = DateFormat("dd MMMM yyyy");
                final time = chats[index].timestamp!.toDate();
                return InkWell(
                  borderRadius: BorderRadius.circular(width * 0.04),
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
                          child: Center(
                              child: SvgPicture.asset(IconsPath.rightArrow)),
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
