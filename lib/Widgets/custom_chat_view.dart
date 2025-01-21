import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/icons_path.dart';
import 'package:chatty_ai/Widgets/white_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomChatView extends StatelessWidget {
  final String title, capabilitiesTitle;
  final List<Map<String, String>> capabilites;
  final bool showIcon;
  final NavigationService navigationService;
  const CustomChatView({
    super.key,
    required this.title,
    required this.navigationService,
    required this.capabilitiesTitle,
    required this.capabilites,
    required this.showIcon,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      appBar: whiteAppBar(
        width: width,
        backArrow: true,
        title: title,
        navigationService: navigationService,
      ),
      body: SafeArea(
        child: SizedBox(
          width: width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  _Capabilities(
                    width: width,
                    height: height,
                    capabilitiesTitle: capabilitiesTitle,
                    capabilities: capabilites,
                    showIcon: showIcon,
                  ),
                ],
              ),
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
}

class _Capabilities extends StatelessWidget {
  final double width, height;
  final String capabilitiesTitle;
  final List<Map<String, String>> capabilities;
  final bool showIcon;
  const _Capabilities(
      {required this.width,
      required this.height,
      required this.capabilitiesTitle,
      required this.capabilities,
      required this.showIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.1),
      child: Column(
        children: [
          showIcon
              ? SvgPicture.asset(
                  IconsPath.appLogo,
                  width: width * 0.38,
                  colorFilter: ColorFilter.mode(
                    AppColors.grey60,
                    BlendMode.lighten,
                  ),
                )
              : const SizedBox(),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            capabilitiesTitle,
            style: TextStyle(
              color: AppColors.capabilitiesTitle,
              fontSize: width * 0.045,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          SizedBox(
            width: width * 0.9,
            height: height * 0.45,
            child: ListView.builder(
              itemCount: capabilities.length,
              itemBuilder: (context, index) {
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
                      Text(
                        capabilities[index]["sentence_first"]!,
                        style: TextStyle(
                          color: AppColors.grey80,
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.04,
                        ),
                      ),
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

class _InputField extends StatefulWidget {
  final double width, height;
  const _InputField({required this.width, required this.height});

  @override
  State<_InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<_InputField> {
  final String inputFieldHintText = "Ask me anything...";

  final FocusNode inputFieldFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height * 0.1,
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: widget.width * 0.72,
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
                  fontSize: widget.width * 0.04,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.width * 0.03),
                  borderSide: BorderSide(
                    color: AppColors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.width * 0.03),
                  borderSide: BorderSide(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: widget.width * 0.15,
            height: widget.width * 0.15,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.primary),
                shape: WidgetStatePropertyAll(CircleBorder()),
              ),
              child: Transform.rotate(
                angle: -44.7,
                child: Transform.scale(
                  scale: widget.width * 0.007,
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: widget.height * 0.0008,
                        left: widget.width * 0.008),
                    child: SvgPicture.asset(
                      IconsPath.send,
                      width: widget.width * 0.08,
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
