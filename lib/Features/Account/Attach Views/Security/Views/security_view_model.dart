import 'package:chatty_ai/Constants/custom_view_model.dart';

class SecurityViewModel extends ViewModel {
  bool _rememberMe = false;
  bool _biometricID = false;
  bool _faceID = false;

  bool get rememberMe => _rememberMe;
  bool get biometricID => _biometricID;
  bool get faceID => _faceID;

  void rememberMeOnValueChanged(bool value) {
    _rememberMe = value;
    notifyListeners();
  }

  void biometricIDOnValueChanged(bool value) {
    _biometricID = value;
    notifyListeners();
  }

  void faceIDValueChanged(bool value) {
    _faceID = value;
    notifyListeners();
  }
}
