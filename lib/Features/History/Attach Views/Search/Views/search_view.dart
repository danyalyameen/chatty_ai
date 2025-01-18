import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/icons_path.dart';
import 'package:chatty_ai/Features/History/Attach%20Views/Search/Views/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class SearchView extends StackedView<SearchViewModel> {
  const SearchView({super.key});

  @override
  Widget builder(
      BuildContext context, SearchViewModel viewModel, Widget? child) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      body: Column(
        children: [
          _SearchBar(
            width: width,
            height: height,
          ),
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
        top: height * 0.06,
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(width * 0.04),
            child: Center(
              child: InkWell(
                onTap: () => viewModel.navigationService.back(),
                child: SvgPicture.asset(
                  IconsPath.backArrow,
                  width: width * 0.04,
                  height: height * 0.04,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: width * 0.04),
              decoration: BoxDecoration(
                color: viewModel.searchNode.hasFocus
                    ? AppColors.primary40
                    : AppColors.grey,
                borderRadius: BorderRadius.circular(width * 0.04),
              ),
              child: TextField(
                focusNode: viewModel.searchNode,
                autofocus: true,
                style: TextStyle(
                  color: AppColors.primaryBlack,
                  fontSize: width * 0.05,
                ),
                cursorHeight: height * 0.025,
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
