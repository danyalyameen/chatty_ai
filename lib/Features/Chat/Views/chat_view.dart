import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/icons_path.dart';
import 'package:chatty_ai/Features/Chat/Views/chat_view_model.dart';
import 'package:chatty_ai/Widgets/custom_chat_view.dart';
import 'package:chatty_ai/Widgets/custom_elevated_button.dart';
import 'package:chatty_ai/Widgets/white_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class ChatView extends StackedView<ChatViewModel> {
  const ChatView({super.key});

  // App Bar Title
  final String title = 'Chatty AI';

  @override
  Widget builder(BuildContext context, ChatViewModel viewModel, Widget? child) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // Display UIs on Screen
      body: viewModel.navigationViews[viewModel.currentIndex],
      // Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        color: AppColors.primaryLight,
        child: _BottomNavigation(
          width: width,
          height: height,
        ),
      ),
    );
  }

  @override
  ChatViewModel viewModelBuilder(BuildContext context) => ChatViewModel();
}

class ChatUI extends ViewModelWidget<ChatViewModel> {
  ChatUI({super.key});

  // Const Texts
  final String title = 'Welcome to';
  final String appName = 'Chatty AI 👋';
  final String subTitle1 = 'Start chatting with ChattyAI Now.';
  final String subTitle2 = 'You can ask me anything.';
  final String buttonText = 'Start Chat';
  final String chatViewTitle = "Chatty AI";
  final String capabilitesTitle = "Capabilites";
  final List<Map<String, String>> capabilites = [
    {
      "sentence_first": "Asnwer all your questions.",
      "sentence_second": "Just ask me anything you like!",
    },
    {
      "sentence_first": "Generate all the text you want.",
      "sentence_second": "(essays, articles, reports, stories, & more)",
    },
    {
      "sentence_first": "Conversational AI.",
      "sentence_second": "(I can talk to you like a natural human)",
    },
  ];

  @override
  Widget build(BuildContext context, ChatViewModel viewModel) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      // Custom White App Bar Widget
      appBar: whiteAppBar(
        title: title,
        width: width,
        backArrow: false,
      ),
      // Display UIs on Screen
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // App Logo
          Center(
            child: SvgPicture.asset(
              IconsPath.appLogo,
              width: width * 0.5,
              height: width * 0.5,
            ),
          ),
          // For Spacing
          SizedBox(height: height * 0.01),
          // Title
          Text(
            title,
            style: TextStyle(
              color: AppColors.primaryBlack,
              fontSize: width * 0.11,
              fontWeight: FontWeight.w700,
            ),
          ),
          // App Name Title
          Text(
            appName,
            style: TextStyle(
              color: AppColors.primary,
              fontSize: width * 0.1,
              fontWeight: FontWeight.w700,
            ),
          ),
          // For Spacing
          SizedBox(height: height * 0.04),
          // Sub Titles 1
          Text(
            subTitle1,
            style: TextStyle(
              color: AppColors.black80,
              fontSize: width * 0.045,
              fontWeight: FontWeight.w300,
            ),
          ),
          // Sub Titles 2
          Text(
            subTitle2,
            style: TextStyle(
              color: AppColors.black80,
              fontSize: width * 0.045,
              fontWeight: FontWeight.w300,
            ),
          ),
          // For Spacing
          SizedBox(height: height * 0.05),
          // Custom Elevated Button for Start Chat
          CustomElevatedButton(
            width: width * 0.9,
            height: height,
            text: buttonText,
            elevation: true,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomChatView(
                    title: title,
                    showIcon: true,
                    capabilites: capabilites,
                    capabilitiesTitle: capabilitesTitle,
                    navigationService: viewModel.navigationService,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _BottomNavigation extends ViewModelWidget<ChatViewModel> {
  final double width, height;
  const _BottomNavigation({required this.width, required this.height});

  @override
  Widget build(BuildContext context, ChatViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        viewModel.iconsFill.length,
        (index) {
          return InkWell(
            borderRadius: BorderRadius.circular(width),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              viewModel.updateCurrentIndex(index);
            },
            child: Column(
              children: [
                // Bottom Navigation Icon
                Center(
                  child: SvgPicture.asset(
                    viewModel.currentIndex == index
                        ? viewModel.iconsFill[index]
                        : viewModel.iconsOutline[index],
                    width: width * 0.06,
                    height: width * 0.06,
                    colorFilter: ColorFilter.mode(
                      viewModel.currentIndex == index
                          ? AppColors.primary
                          : AppColors.black60,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                // Bottom Navigation Text
                SizedBox(
                  height: height * 0.005,
                ),
                Text(
                  viewModel.titles[index],
                  style: TextStyle(
                    color: viewModel.currentIndex == index
                        ? AppColors.primary
                        : AppColors.black60,
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
