import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/icons_path.dart';
import 'package:chatty_ai/Features/Chat/Attach%20Views/Custom%20Chat%20View/Views/custom_chat_view_model.dart';
import 'package:chatty_ai/Widgets/white_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';
import 'package:typewritertext/typewritertext.dart';

class CustomChatView extends StackedView<CustomChatViewModel> {
  final String title, capabilitiesTitle;
  final List<Map<String, String>> capabilites;
  final bool showLogo;
  const CustomChatView({
    super.key,
    required this.title,
    required this.capabilitiesTitle,
    required this.capabilites,
    required this.showLogo,
  });

  @override
  Widget builder(
      BuildContext context, CustomChatViewModel viewModel, Widget? child) {
    // Get Screen Size of Device
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      appBar: whiteAppBar(
        width: width,
        backArrow: true,
        title: title,
        navigationService: viewModel.navigationService,
      ),
      body: SafeArea(
        child: SizedBox(
          width: width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  _Chat(
                    width: width,
                    height: height,
                  ),
                ],
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

class _Chat extends ViewModelWidget<CustomChatViewModel> {
  final double width, height;
  const _Chat({required this.width, required this.height});

  @override
  Widget build(BuildContext context, CustomChatViewModel viewModel) {
    return SizedBox(
      width: width,
      height: height * 0.1,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: height * 0.04),
            child: SizedBox(
              width: width,
              height: height * 0.6,
              child: ListView(
                children: [
                  // User Prompt
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width:
                          width * viewModel.chatController.text.length * 0.028,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(width * 0.04),
                      ),
                      margin: EdgeInsets.only(
                          right: width * 0.06, left: width * 0.18),
                      padding: EdgeInsets.all(width * 0.04),
                      child: Center(
                        child: Text(
                          viewModel.chatController.text,
                          style: TextStyle(
                            color: AppColors.primaryLight,
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.042,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  // AI Answer
                  Align(
                    alignment: Alignment.topLeft,
                    child: FutureBuilder(
                        future: viewModel.startChat(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                width: width * 0.4,
                                height: height * 0.1,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(width * 0.04),
                                  color: AppColors.primary,
                                ),
                              ),
                            );
                          }
                          final message = snapshot.data;
                          return Container(
                            width: width * message!.length * 0.018,
                            decoration: BoxDecoration(
                              color: AppColors.grey60,
                              borderRadius: BorderRadius.circular(width * 0.04),
                            ),
                            margin: EdgeInsets.only(
                                left: width * 0.04, right: width * 0.18),
                            padding: EdgeInsets.all(width * 0.04),
                            child: Center(
                              child: TypeWriter.text(
                                message,
                                duration: const Duration(milliseconds: 100),
                                style: TextStyle(
                                  color: AppColors.primaryBlack,
                                  fontWeight: FontWeight.w500,
                                  fontSize: width * 0.04,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
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
      height: height * 0.1,
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Text Field for chat
          SizedBox(
            width: width * 0.72,
            child: TextField(
              focusNode: inputFieldFocusNode,
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
                enabledBorder: OutlineInputBorder(
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
          SizedBox(
            width: width * 0.15,
            height: width * 0.15,
            child: ElevatedButton(
              onPressed: () async {
                await viewModel.startChat();
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.primary),
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
                          AppColors.primaryLight, BlendMode.srcIn),
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
