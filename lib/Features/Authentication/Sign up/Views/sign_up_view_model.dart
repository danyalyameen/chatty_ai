import 'package:chatty_ai/App/app.router.dart';
import 'package:chatty_ai/Constants/constants.dart';
import 'package:chatty_ai/Constants/custom_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SignUpViewModel extends ViewModel {
  // Final Fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Get Final Fields
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  GlobalKey<FormState> get formKey => _formKey;
  var emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  // Non Final Fields
  bool _isShow = false;
  bool _isCheck = false;
  bool _showLoading = false;
  bool _isErrorOnCheck = false;
  String errorCode = "";
  // Get Non Final Fields
  bool get isShow => _isShow;
  bool get isCheck => _isCheck;
  bool get isErrorOnCheck => _isErrorOnCheck;
  bool get showLoading => _showLoading;

  // Show Password Toggle
  void iconToggle() {
    _isShow = !_isShow;
    notifyListeners();
  }

  // Check Toggle
  void checkToggle(bool? value) {
    value != null ? _isCheck = value : _isCheck;
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
      if (errorCode == "email-already-in-use") {
        errorCode = "";
        return "Email Already In Use";
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

  // Validate Check
  void validateCheck() {
    if (!_isCheck) {
      _isErrorOnCheck = true;
      notifyListeners();
    }
  }

  // Continue Button Function
  void continueButtonFunction() async {
    validateCheck();
    if (formKey.currentState!.validate() && isCheck) {
      try {
        // Initialize Shared Preferences
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        // Show Loading
        _showLoading = true;
        notifyListeners();
        // Sign UP User
        await authService.signUp(
          email: emailController.text,
          password: passwordController.text,
        );
        // Hide Loading
        _showLoading = false;
        notifyListeners();
        // Save Logged In
        sharedPreferences.setBool(Constants.loggedIn, true);
        // Navigation
        navigationService.replaceWithCompleteProfileView();
      } on FirebaseAuthException catch (e) {
        _showLoading = false;
        errorCode = e.code;
        notifyListeners();
        log(e.toString());
      }
    }
  }
}
