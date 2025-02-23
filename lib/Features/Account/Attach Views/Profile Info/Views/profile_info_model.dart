import 'dart:io';

import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/custom_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileInfoModel extends ViewModel {
  // Final Fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // Non Final Fields
  ValueNotifier<bool> imageError = ValueNotifier(false);
  File? image;
  ValueNotifier<DateTime> initialDate = ValueNotifier(DateTime.now());
  ValueNotifier showLoading = ValueNotifier(false);

  void updateProfile() async {
    showLoading.value = true;
    await firestoreService.updateUser(
      name: nameController.text,
      gender: genderController.text,
      dob: Timestamp.fromDate(initialDate.value),
      profileCompleted: true,
    );
    if (image != null) {
      await imageService.updateImage(image: image!);
    }
    showLoading.value = false;
    Fluttertoast.showToast(
      msg: "Profile Update Successfully!",
      textColor: AppColors.black40,
      backgroundColor: AppColors.grey80,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
    );
  }
}
