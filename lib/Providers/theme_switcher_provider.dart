import 'package:chatty_ai/Constants/app_theme.dart';
import 'package:chatty_ai/Constants/constants.dart';
import 'package:flutter/material.dart';

class ThemeSwitcherProvider extends ChangeNotifier {
  // Non Final Fields
  ThemeData _theme = AppTheme.darkTheme;
  // Get Non Final Fields
  ThemeData get theme => _theme;
  // Switching Between Themes
  void switchTheme() {
    _theme = _theme == AppTheme.lightTheme
        ? AppTheme.darkTheme
        : AppTheme.lightTheme;
    Constants.isDark = AppTheme.darkTheme == _theme;
    notifyListeners();
  }
}
