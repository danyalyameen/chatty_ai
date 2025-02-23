import 'package:chatty_ai/Constants/custom_view_model.dart';
import 'package:chatty_ai/Providers/theme_switcher_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountViewModel extends ViewModel {
  // Non Final Fields
  ValueNotifier<bool> isDarkMode = ValueNotifier(false);
  ValueNotifier<bool> imageError = ValueNotifier(false);
  String name = "";
  String gender = "";
  DateTime dob = DateTime.now();

  // Toggle Dark Mode
  void toggleDarkMode({required bool value, required BuildContext context}) {
    isDarkMode.value = value;
    Provider.of<ThemeSwitcherProvider>(context, listen: false).switchTheme();
  }
}
