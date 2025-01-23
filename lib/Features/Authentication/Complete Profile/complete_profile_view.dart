import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Features/Authentication/Complete%20Profile/complete_profile_view_model.dart';
import 'package:chatty_ai/Widgets/custom_date_picker.dart';
import 'package:chatty_ai/Widgets/custom_drop_down.dart';
import 'package:chatty_ai/Widgets/custom_elevated_button.dart';
import 'package:chatty_ai/Widgets/custom_image_picker.dart';
import 'package:chatty_ai/Widgets/custom_text_form_field.dart';
import 'package:chatty_ai/Widgets/white_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CompleteProfileView extends StackedView<CompleteProfileViewModel> {
  const CompleteProfileView({super.key});

  final String title = "Complete Profile";
  final String continueText = "Continue";

  @override
  Widget builder(
      BuildContext context, CompleteProfileViewModel viewModel, Widget? child) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryLight,
      appBar: whiteAppBar(backArrow: true, title: title, width: width),
      body: Column(
        children: [
          // Main Headings
          _Titles(
            width: width,
            height: height,
          ),
          // For Spacing
          SizedBox(
            height: height * 0.02,
          ),
          // User Image
          _UserImage(
            width: width,
            height: height,
          ),
          // For Spacing
          SizedBox(
            height: height * 0.04,
          ),
          // User Input Fields like Drop Dwn
          _InputFields(
            width: width,
            height: height,
          ),
          // For Spacing
          SizedBox(
            height: height * 0.04,
          ),
          // Button
          CustomElevatedButton(
            width: width * 0.94,
            height: height,
            elevation: true,
            text: continueText,
          ),
        ],
      ),
    );
  }

  @override
  CompleteProfileViewModel viewModelBuilder(BuildContext context) =>
      CompleteProfileViewModel();
}

class _Titles extends StatelessWidget {
  final double width, height;
  const _Titles({required this.width, required this.height});

  final String title = "Complete your profile 🗒️";
  final String description =
      "Please enter your profile. Don't worry, only you can see your personal data. No one else will be able to see it.";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main Title
          Text(
            title,
            style: TextStyle(
              color: AppColors.primaryBlack,
              fontSize: width * 0.072,
              fontWeight: FontWeight.w900,
            ),
          ),
          // For Spacing
          SizedBox(
            height: height * 0.015,
          ),
          // Main Description
          Text(
            description,
            style: TextStyle(
              color: AppColors.primaryBlack,
              fontWeight: FontWeight.w400,
              fontSize: width * 0.045,
            ),
          )
        ],
      ),
    );
  }
}

class _UserImage extends ViewModelWidget<CompleteProfileViewModel> {
  final double width, height;
  const _UserImage({required this.width, required this.height});
  @override
  Widget build(BuildContext context, CompleteProfileViewModel viewModel) {
    return UnconstrainedBox(
      child: InkWell(
        borderRadius: BorderRadius.circular(width),
        onTap: () {
          // Show Bottom Sheet for pick Image
          ShowBottomSheetForImportImages.bottomSheet(
            context: context,
            width: width,
            height: height,
          );
        },
        child: SizedBox(
          width: width * 0.35,
          height: width * 0.35,
          child: Stack(
            children: [
              // Circle Background
              Center(
                child: CircleAvatar(
                  radius: width * 0.18,
                  backgroundColor: AppColors.grey60,
                  child: Padding(
                    padding: EdgeInsets.only(top: height * 0.026),
                    child: ClipOval(
                      child: Icon(
                        Icons.person,
                        size: width * 0.35,
                        color: AppColors.grey80,
                      ),
                    ),
                  ),
                ),
              ),
              // User Image
              Positioned(
                bottom: height * 0.005,
                right: width * 0.02,
                child: Container(
                  width: width * 0.07,
                  height: width * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.03),
                    color: AppColors.primary,
                  ),
                  child: Icon(
                    Icons.edit,
                    size: width * 0.05,
                    color: AppColors.primaryLight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InputFields extends ViewModelWidget<CompleteProfileViewModel> {
  final double width, height;
  _InputFields({required this.width, required this.height});

  final String textFieldText = "Full Name";
  final String dropDownText = "Gender";
  final String datePickerTitle = "Date of Birth";
  final List<String> items = ["Male", "Female"];

  @override
  Widget build(BuildContext context, CompleteProfileViewModel viewModel) {
    return Column(
      children: [
        // Name Text Field
        CustomTextFormField(
          showIcon: false,
          title: textFieldText,
          hintText: textFieldText,
        ),
        // For Spacing
        SizedBox(
          height: height * 0.04,
        ),
        // Drop Down
        CustomDropDown(
          width: width,
          height: height,
          title: dropDownText,
          hintText: dropDownText,
          controller: viewModel.genderController,
          items: items,
        ),
        // For Spacing
        SizedBox(
          height: height * 0.04,
        ),
        // Date Picker for Date of Birth
        CustomDatePicker(
          width: width,
          height: height,
          title: datePickerTitle,
        ),
      ],
    );
  }
}
