import 'package:chatty_ai/Constants/custom_view_model.dart';

class ChatViewModel extends ViewModel {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  // To Change the Current Index of Bottom Navigation Bar
  void updateCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
