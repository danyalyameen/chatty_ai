import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/custom_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPasswordViewModel extends ViewModel {
  // Final Fields
  final TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  // Validate Email
  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your email';
    } else {
      if (!emailValid.hasMatch(value)) {
        return 'Please enter a valid email';
      }
      return null;
    }
  }

  // Continue Button Function
  void continueButtonFunction({required double width}) {
    if (formKey.currentState!.validate()) {
      authService.passwordResetLink(email: emailController.text);
      Fluttertoast.showToast(
        msg: "Password Reset Link Send Successfully",
        backgroundColor: AppColors.grey80,
        textColor: AppColors.primaryLight,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
        fontSize: width * 0.04,
      );
      navigationService.back();
    }
  }
}
