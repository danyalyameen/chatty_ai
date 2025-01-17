import 'package:chatty_ai/Features/History/Views/history_view_model.dart';
import 'package:chatty_ai/Widgets/white_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HistoryView extends StackedView<HistoryViewModel> {
  const HistoryView({super.key});

  final String title = 'History';

  @override
  Widget builder(
      BuildContext context, HistoryViewModel viewModel, Widget? child) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: whiteAppBar(title: title, width: width,),
    );
  }

  @override
  HistoryViewModel viewModelBuilder(BuildContext context) => HistoryViewModel();
}
