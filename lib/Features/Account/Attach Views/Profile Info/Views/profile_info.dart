import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Features/Account/Attach%20Views/Profile%20Info/Views/profile_info_model.dart';
import 'package:chatty_ai/Widgets/custom_date_picker.dart';
import 'package:chatty_ai/Widgets/custom_drop_down.dart';
import 'package:chatty_ai/Widgets/custom_elevated_button.dart';
import 'package:chatty_ai/Widgets/custom_image_picker.dart';
import 'package:chatty_ai/Widgets/custom_text_form_field.dart';
import 'package:chatty_ai/Widgets/white_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

class ProfileInfo extends StackedView<ProfileInfoModel> {
  final String name, gender;
  final DateTime dob;
  const ProfileInfo(
      {required this.name, required this.gender, required this.dob, super.key});

  // Variables
  final String title = "Profile Info";
  final String continueText = "Continue";

  // Disposing Controllers
  @override
  void onViewModelReady(ProfileInfoModel viewModel) async {
    viewModel.nameController.text = name;
    viewModel.genderController.text = gender;
    viewModel.initialDate.value = dob;
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
      BuildContext context, ProfileInfoModel viewModel, Widget? child) {
    // Get Screen Size of a Device
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
            ValueListenableBuilder(
              valueListenable: viewModel.showLoading,
              builder: (context, value, child) {
                return CustomElevatedButton(
                  width: width * 0.94,
                  height: height,
                  elevation: true,
                  showLoading: value,
                  text: continueText,
                  onPressed: () => viewModel.updateProfile(),
                );
              },
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
        onTap: () async {
          // Show Bottom Sheet for pick Image
          viewModel.image = await ShowBottomSheetForImportImages.bottomSheet(
            context: context,
            width: width,
            height: height,
          );
          viewModel.imageError.value = false;
          viewModel.notifyListeners();
        },
        child: SizedBox(
          width: width * 0.35,
          height: width * 0.35,
          child: Stack(
            children: [
              FutureBuilder(
                future: precacheImage(
                    NetworkImage(viewModel.imageService.getUserImage()),
                    context),
                builder: (context, snapshot) {
                  // Loading State
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width: width * 0.35,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  }
                  return ValueListenableBuilder(
                    valueListenable: viewModel.imageError,
                    builder: (context, value, child) {
                      return CircleAvatar(
                        radius: width * 0.2,
                        backgroundImage: viewModel.image == null
                            ? NetworkImage(
                                viewModel.imageService.getUserImage(),
                              )
                            : FileImage(viewModel.image!),
                        backgroundColor:
                            value ? AppColors.grey60 : Colors.transparent,
                        onBackgroundImageError: (exception, stackTrace) {
                          viewModel.imageError.value = true;
                        },
                        child: value
                            ? Padding(
                                padding: EdgeInsets.only(top: height * 0.026),
                                child: ClipOval(
                                  child: Icon(
                                    Icons.person,
                                    size: width * 0.35,
                                    color: AppColors.grey80,
                                  ),
                                ),
                              )
                            : null,
                      );
                    },
                  );
                },
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

  // Variables
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
          controller: viewModel.nameController,
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
          selectedValue: (value) {},
          items: items,
        ),
        // For Spacing
        SizedBox(
          height: height * 0.04,
        ),
        // Date Picker for Date of Birth
        ValueListenableBuilder(
            valueListenable: viewModel.initialDate,
            builder: (context, value, child) {
              return CustomDatePicker(
                width: width,
                height: height,
                title: datePickerTitle,
                initialDate: value,
                onChange: (date) {
                  date != null ? viewModel.initialDate.value = date : null;
                },
              );
            }),
      ],
    );
  }
}
