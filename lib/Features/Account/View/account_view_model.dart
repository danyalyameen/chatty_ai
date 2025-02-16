import 'package:chatty_ai/Constants/custom_view_model.dart';
import 'package:flutter/material.dart';

class AccountViewModel extends ViewModel {
  // Non Final Fields
  bool _isDarkMode = false;
  ValueNotifier<bool> imageError = ValueNotifier(false);
  // Get Non Final Feilds
  bool get isDarkMode => _isDarkMode;

  // Toggle Dark Mode
  void toggleDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}
