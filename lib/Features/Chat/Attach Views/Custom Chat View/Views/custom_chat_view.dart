import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/icons_path.dart';
import 'package:chatty_ai/Features/Chat/Attach%20Views/Custom%20Chat%20View/Views/custom_chat_view_model.dart';
import 'package:chatty_ai/Widgets/white_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

class CustomChatView extends StackedView<CustomChatViewModel> {
  CustomChatView({
    super.key,
  });

  // Variables
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

  // Dispose Controllers
  @override
  void onDispose(CustomChatViewModel viewModel) {
    viewModel.chatController.value.dispose();
    viewModel.listViewController.dispose();
    viewModel.scrollTimer?.cancel();
    super.onDispose(viewModel);
  }

  @override
  Widget builder(
      BuildContext context, CustomChatViewModel viewModel, Widget? child) {
    viewModel.shouldAutoScroll ? viewModel.startAutoScroll() : null;
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
          viewModel.onBackButton();
        },
      ),
      body: SafeArea(
        child: SizedBox(
          width: width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Chats
              viewModel.askPrompt
                  ? Positioned(
                      bottom: height * 0.1,
                      top: height * 0.0001,
                      child: SizedBox(
                        width: width,
                        height: height * 0.75,
                        child: ListView.builder(
                          controller: viewModel.listViewController,
                          itemCount: viewModel.messages.length,
                          itemBuilder: (context, index) {
                            return viewModel.messages[index].isUser!
                                ? _Prompt(
                                    width: width,
                                    height: height,
                                    index: index,
                                  )
                                : _Answer(
                                    width: width,
                                    height: height,
                                    index: index,
                                  );
                          },
                        ),
                      ),
                    )
                  : _Capabilities(
                      width: width,
                      height: height,
                      capabilitiesTitle: capabilitesTitle,
                      capabilities: capabilites,
                      showLogo: true,
                    ),
              // Chat Input Field
              Positioned(
                bottom: 0,
                child: _InputField(
                  width: width,
                  height: height,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  CustomChatViewModel viewModelBuilder(BuildContext context) =>
      CustomChatViewModel();
}

// Prompt UI
class _Prompt extends ViewModelWidget<CustomChatViewModel> {
  final double width, height;
  final int index;
  const _Prompt(
      {required this.index, required this.width, required this.height});

  @override
  Widget build(BuildContext context, CustomChatViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.02),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          width: width * viewModel.messages[index].text!.length * 0.028,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(width * 0.04),
          ),
          margin: EdgeInsets.only(right: width * 0.06, left: width * 0.18),
          padding: EdgeInsets.all(width * 0.04),
          child: Center(
            child: Text(
              viewModel.messages[index].text!,
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
class _Answer extends ViewModelWidget<CustomChatViewModel> {
  final double width, height;
  final int index;
  const _Answer(
      {required this.index, required this.width, required this.height});

  @override
  Widget build(BuildContext context, CustomChatViewModel viewModel) {
    return index == viewModel.messages.length - 1 &&
            viewModel.messages[index].responseGenerated != true
        ? viewModel.showLoading
            ? Padding(
                padding: EdgeInsets.only(left: width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Shimmer Effect or Loading
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width: width * 0.8,
                        height: height * 0.04,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width * 0.04),
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    // For Spacing
                    SizedBox(
                      height: height * 0.008,
                    ),
                    // Shimmer Effect or Loading
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width: width * 0.8,
                        height: height * 0.04,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width * 0.04),
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Builder(
                builder: (context) {
                  viewModel.messages[index].responseGenerated = true;
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width:
                          width * viewModel.messages[index].text!.length * 0.1,
                      decoration: BoxDecoration(
                        color: AppColors.grey60,
                        borderRadius: BorderRadius.circular(width * 0.04),
                      ),
                      margin: EdgeInsets.only(
                          left: width * 0.04, right: width * 0.18),
                      padding: EdgeInsets.all(width * 0.04),
                      child: AnimatedTextKit(
                        isRepeatingAnimation: false,
                        repeatForever: false,
                        totalRepeatCount: 1,
                        animatedTexts: [
                          TyperAnimatedText(
                            viewModel.messages[index].text!,
                            speed: const Duration(milliseconds: 10),
                            textStyle: TextStyle(
                              color: AppColors.primaryBlack,
                              fontWeight: FontWeight.w500,
                              fontSize: width * 0.04,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
        : Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: width * viewModel.messages[index].text!.length * 0.1,
              decoration: BoxDecoration(
                color: AppColors.grey60,
                borderRadius: BorderRadius.circular(width * 0.04),
              ),
              margin: EdgeInsets.only(left: width * 0.04, right: width * 0.18),
              padding: EdgeInsets.all(width * 0.04),
              child: Text(
                viewModel.messages[index].text!,
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

class _Capabilities extends StatelessWidget {
  final double width, height;
  final String capabilitiesTitle;
  final List<Map<String, String>> capabilities;
  final bool showLogo;
  const _Capabilities(
      {required this.width,
      required this.height,
      required this.capabilitiesTitle,
      required this.capabilities,
      required this.showLogo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.1),
      child: Column(
        children: [
          // Logo of App
          showLogo
              ? SvgPicture.asset(
                  IconsPath.appLogo,
                  width: width * 0.38,
                  colorFilter: ColorFilter.mode(
                    AppColors.grey60,
                    BlendMode.lighten,
                  ),
                )
              : const SizedBox(),
          // For Spacing
          SizedBox(
            height: height * 0.02,
          ),
          // Capbilities Title
          Text(
            capabilitiesTitle,
            style: TextStyle(
              color: AppColors.capabilitiesTitle,
              fontSize: width * 0.045,
              fontWeight: FontWeight.w700,
            ),
          ),
          // For Spacing
          SizedBox(
            height: height * 0.02,
          ),
          // Capabilities
          SizedBox(
            width: width * 0.9,
            height: height * 0.45,
            child: ListView.builder(
              itemCount: capabilities.length,
              itemBuilder: (context, index) {
                // Background Color
                return Container(
                  height: height * 0.1,
                  margin: EdgeInsets.symmetric(
                    vertical: height * 0.01,
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.04, vertical: height * 0.01),
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(width * 0.04),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // First Line or First Sentence
                      Text(
                        capabilities[index]["sentence_first"]!,
                        style: TextStyle(
                          color: AppColors.grey80,
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.04,
                        ),
                      ),
                      // Second Line or Second Sentence
                      Text(
                        capabilities[index]["sentence_second"]!,
                        style: TextStyle(
                          color: AppColors.grey80,
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.04,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _InputField extends ViewModelWidget<CustomChatViewModel> {
  final double width, height;
  _InputField({required this.width, required this.height});

  // Variables
  final String inputFieldHintText = "Ask me anything...";
  final FocusNode inputFieldFocusNode = FocusNode();

  @override
  Widget build(BuildContext context, CustomChatViewModel viewModel) {
    return Container(
      width: width,
      height: viewModel.chatController.value.text.length > 29
          ? height * 0.12
          : height * 0.1,
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Text Field for chat
          Container(
            width: width * 0.72,
            margin: EdgeInsets.symmetric(vertical: height * 0.01),
            height: viewModel.chatController.value.text.length > 29
                ? height * 0.18
                : null,
            child: TextFormField(
              controller: viewModel.chatController.value,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              maxLines: null,
              decoration: InputDecoration(
                filled: true,
                fillColor: inputFieldFocusNode.hasFocus
                    ? AppColors.primary40
                    : AppColors.grey,
                hintText: inputFieldHintText,
                hintStyle: TextStyle(
                  color: AppColors.grey80,
                  fontWeight: FontWeight.w500,
                  fontSize: width * 0.04,
                ),
                enabledBorder: inputFieldFocusNode.hasFocus
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(width * 0.03),
                        borderSide: BorderSide(
                          color: AppColors.primary,
                        ),
                      )
                    : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(width * 0.03),
                        borderSide: BorderSide(
                          color: AppColors.grey,
                        ),
                      ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(width * 0.03),
                  borderSide: BorderSide(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ),
          // Button for Send Chat
          ValueListenableBuilder(
            valueListenable: viewModel.chatController.value,
            builder: (context, _, child) {
              return SizedBox(
                width: width * 0.15,
                height: width * 0.15,
                child: ElevatedButton(
                  onPressed: () {
                    viewModel.shouldAutoScroll = true;
                    viewModel.notifyListeners();
                    viewModel.startChat();
                  },
                  style: ButtonStyle(
                    backgroundColor: viewModel.chatController.value.text.isEmpty
                        ? WidgetStatePropertyAll(AppColors.grey60)
                        : WidgetStatePropertyAll(AppColors.primary),
                    shape: WidgetStatePropertyAll(CircleBorder()),
                  ),
                  child: Transform.rotate(
                    angle: -44.7,
                    child: Transform.scale(
                      scale: width * 0.007,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: width * 0.008,
                        ),
                        child: SvgPicture.asset(
                          IconsPath.send,
                          width: width * 0.08,
                          colorFilter: ColorFilter.mode(
                            viewModel.chatController.value.text.isEmpty
                                ? AppColors.grey80
                                : AppColors.primaryLight,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
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
