import 'dart:developer';
import 'dart:io';

import 'package:chatty_ai/App/app.router.dart';
import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/constants.dart';
import 'package:chatty_ai/Constants/custom_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompleteProfileViewModel extends ViewModel {
  // Final Fields
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Get Final Fields
  TextEditingController get nameController => _nameController;
  GlobalKey<FormState> get formKey => _formKey;
  // Non Final Fields
  File? image;
  String? gender;
  DateTime? date;
  bool _showLoading = false;
  // Get Non Final Fields
  bool get showLoading => _showLoading;

  // Validate User Image
  void validateUserImage(
      {required BuildContext context, required double width}) {
    if (image == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // Title
            title: Text(
              "No Image Selected",
              style: TextStyle(
                color: AppColors.primaryBlack,
                fontWeight: FontWeight.w600,
                fontSize: width * 0.045,
              ),
            ),
            // Description
            content: Text(
              "Are you sure you want to continue?",
              style: TextStyle(
                color: AppColors.primaryBlack,
                fontWeight: FontWeight.w400,
                fontSize: width * 0.04,
              ),
            ),
            // Buttons
            actions: [
              // Cancel Button
              TextButton(
                onPressed: () => navigationService.back(),
                child: const Text("Cancel"),
              ),
              // Ok Button
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(AppColors.primary),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * 0.04),
                    ),
                  ),
                ),
                onPressed: () => navigationService.replaceWithChatView(),
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  // Validate Name
  String? validateName(String? value) {
    if (value!.isEmpty) {
      return "Please enter your name";
    }
    return null;
  }

  // Validate Drop Down
  void validateDropDown() {
    if (gender == null) {
      Fluttertoast.showToast(
        msg: "Please Select Gender",
        backgroundColor: AppColors.primaryRed,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
        textColor: AppColors.primaryLight,
      );
    }
  }

  // Validate Date
  void validateDate() {
    if (date == null) {
      Fluttertoast.showToast(
        msg: "Please Select Date",
        backgroundColor: AppColors.primaryRed,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
        textColor: AppColors.primaryLight,
      );
    }
  }

  // Continue Button Function
  void continueButtonFunction() async {
    validateDropDown();
    validateDate();
    if (_formKey.currentState!.validate() && gender != null && date != null) {
      try {
        // Show Loading
        _showLoading = true;
        notifyListeners();
        // Initialize Shared Preferences
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        // Add User Info to Database
        await firestoreService.createUser(
          name: nameController.text,
          gender: gender!,
          dob: Timestamp.fromDate(date!),
          profileCompleted: image == null ? false : true,
        );
        // Upload Image
        image != null ? await imageService.uploadImage(image: image!) : null;
        // Save Profile Completed True After Sign Up
        sharedPreferences.setBool(Constants.profileCompleted, true);
        // Hide Loading
        _showLoading = false;
        notifyListeners();
        // Navigation
        navigationService.replaceWithChatView();
      } catch (e) {
        // Hide Loading
        _showLoading = false;
        notifyListeners();
        log(e.toString());
      }
    }
  }
}
