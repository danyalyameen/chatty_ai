import 'package:chatty_ai/Constants/custom_view_model.dart';

class LoginViewModel extends ViewModel {
    bool _isShow = false;
  bool _isCheck = false;
  bool get isShow => _isShow;
  bool get isCheck => _isCheck;

  void iconToggle() {
    _isShow = !_isShow;
    notifyListeners();
  }

  void checkToggle(bool? value) {
    value != null ? _isCheck = value : _isCheck;
    notifyListeners();
  }
}