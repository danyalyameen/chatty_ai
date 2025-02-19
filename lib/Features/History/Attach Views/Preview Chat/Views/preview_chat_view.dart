import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Features/History/Attach%20Views/Preview%20Chat/Views/preview_chart_view_model.dart';
import 'package:chatty_ai/Models/user_model.dart';
import 'package:chatty_ai/Widgets/white_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PreviousChatView extends StackedView<PreviousChatViewModel> {
  final List<Chat> messages;
  const PreviousChatView({
    required this.messages,
    super.key,
  });

  // Variables
  final String chatViewTitle = "Chatty AI";

  @override
  Widget builder(
      BuildContext context, PreviousChatViewModel viewModel, Widget? child) {
    // Get Screen Size of Device
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      appBar: whiteAppBar(
        width: width,
        backArrow: true,
        title: chatViewTitle,
        navigationService: viewModel.navigationService,
        onPressed: () {
          viewModel.navigationService.back();
        },
      ),
      body: SafeArea(
        child: SizedBox(
          width: width,
          height: height,
          child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  // Prompt
                  _Prompt(
                    index: index,
                    width: width,
                    height: height,
                    messages: messages,
                  ),
                  // Answer
                  _Answer(
                    index: index,
                    width: width,
                    height: height,
                    messages: messages,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  PreviousChatViewModel viewModelBuilder(BuildContext context) =>
      PreviousChatViewModel();
}

// Prompt UI
class _Prompt extends ViewModelWidget<PreviousChatViewModel> {
  final double width, height;
  final int index;
  final List<Chat> messages;
  const _Prompt(
      {required this.messages,
      required this.index,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context, PreviousChatViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.02),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          width: width * messages[index].prompt!.length * 0.028,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(width * 0.04),
          ),
          margin: EdgeInsets.only(right: width * 0.06, left: width * 0.18),
          padding: EdgeInsets.all(width * 0.04),
          child: Center(
            child: Text(
              messages[index].prompt!,
              style: TextStyle(
                color: AppColors.primaryLight,
                fontWeight: FontWeight.w600,
                fontSize: width * 0.042,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// AI Answer UI
class _Answer extends ViewModelWidget<PreviousChatViewModel> {
  final double width, height;
  final int index;
  final List<Chat> messages;
  const _Answer(
      {required this.messages,
      required this.index,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context, PreviousChatViewModel viewModel) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: width * messages[index].prompt!.length * 0.1,
        decoration: BoxDecoration(
          color: AppColors.grey60,
          borderRadius: BorderRadius.circular(width * 0.04),
        ),
        margin: EdgeInsets.only(left: width * 0.04, right: width * 0.18),
        padding: EdgeInsets.all(width * 0.04),
        child: Text(
          messages[index].answer!,
          style: TextStyle(
            color: AppColors.primaryBlack,
            fontWeight: FontWeight.w500,
            fontSize: width * 0.04,
          ),
        ),
      ),
    );
  }
}
