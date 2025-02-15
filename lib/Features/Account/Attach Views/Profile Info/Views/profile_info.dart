import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/images_path.dart';
import 'package:chatty_ai/Features/Account/Attach%20Views/Profile%20Info/Views/profile_info_model.dart';
import 'package:chatty_ai/Widgets/custom_date_picker.dart';
import 'package:chatty_ai/Widgets/custom_drop_down.dart';
import 'package:chatty_ai/Widgets/custom_elevated_button.dart';
import 'package:chatty_ai/Widgets/custom_image_picker.dart';
import 'package:chatty_ai/Widgets/custom_text_form_field.dart';
import 'package:chatty_ai/Widgets/white_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProfileInfo extends StackedView<ProfileInfoModel> {
  const ProfileInfo({super.key});

  final String title = "Profile Info";
  final String continueText = "Continue";

  @override
  Widget builder(
      BuildContext context, ProfileInfoModel viewModel, Widget? child) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryLight,
      appBar: whiteAppBar(
        backArrow: true,
        title: title,
        width: width,
        navigationService: viewModel.navigationService,
      ),
      body: Container(
        width: width,
        margin: EdgeInsets.only(top: height * 0.1),
        child: Column(
          children: [
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
              onPressed: () => viewModel.navigationService.back(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ProfileInfoModel viewModelBuilder(BuildContext context) => ProfileInfoModel();
}

class _UserImage extends ViewModelWidget<ProfileInfoModel> {
  final double width, height;
  const _UserImage({required this.width, required this.height});
  @override
  Widget build(BuildContext context, ProfileInfoModel viewModel) {
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
                  child: ClipOval(child: Image.asset(ImagesPath.userImage)),
                ),
              ),
              // Edit Icon
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

class _InputFields extends ViewModelWidget<ProfileInfoModel> {
  final double width, height;
  _InputFields({required this.width, required this.height});

  final String textFieldText = "Full Name";
  final String dropDownText = "Gender";
  final String datePickerTitle = "Date of Birth";
  final List<String> items = ["Male", "Female"];

  @override
  Widget build(BuildContext context, ProfileInfoModel viewModel) {
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
          selectedValue: (value) {},
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
          onChange: (date) {},
        ),
      ],
    );
  }
}
