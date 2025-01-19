import 'package:chatty_ai/Constants/custom_view_model.dart';

class AccountViewModel extends ViewModel {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  void toggleDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}
