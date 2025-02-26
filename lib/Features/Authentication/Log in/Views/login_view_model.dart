import 'dart:developer';

import 'package:chatty_ai/App/app.router.dart';
import 'package:chatty_ai/Constants/constants.dart';
import 'package:chatty_ai/Constants/custom_view_model.dart';
import 'package:chatty_ai/Models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends ViewModel {
  // Final Fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Get Final Fields
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  GlobalKey<FormState> get formKey => _formKey;
  // Non Final Fields
  bool _isShow = false;
  bool _showLoading = false;
  String errorCode = "";
  var emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  // Get Non Final Fields
  bool get isShow => _isShow;
  bool get showLoading => _showLoading;

  // Show Password Icon Toggle
  void iconToggle() {
    _isShow = !_isShow;
    notifyListeners();
  }

  // Validate Email
  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "Please Enter Email";
    } else if (value.isNotEmpty) {
      if (!emailValid.hasMatch(value)) {
        return "Please Enter Valid Email";
      }
      if (errorCode == "invalid-credential") {
        errorCode = "";
        return "Invalid Credential";
      }
      return null;
    }
    return null;
  }

  // Validate Password
  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return "Please Enter Password";
    } else if (value.isNotEmpty) {
      if (value.length < 8) {
        return "Password must be at least 8 characters";
      }
      return null;
    }
    return null;
  }

  // Continue Button Function
  void continueButtonFunction() async {
    if (formKey.currentState!.validate()) {
      try {
        // Show Loading
        _showLoading = true;
        notifyListeners();
        // Initialize Shared Preferences
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        // Login User
        await authService.login(
          email: emailController.text,
          password: passwordController.text,
        );
        // Get User Info
        UserModel? userInfo = await firestoreService.getUserInfo();
        // Hide Loading
        _showLoading = false;
        notifyListeners();
        // Navigation
        if (userInfo!.profileCompleted == true) {
          // Save Logged In
          sharedPreferences.setBool(Constants.loggedIn, true);
          navigationService.replaceWithChatView();
        } else {
          navigationService.replaceWithCompleteProfileView();
        }
      } on FirebaseAuthException catch (e) {
        _showLoading = false;
        notifyListeners();
        errorCode = e.code;
        log(e.toString());
      }
    }
  }
}
