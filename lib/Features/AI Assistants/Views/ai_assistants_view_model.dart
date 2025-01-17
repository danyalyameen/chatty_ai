import 'package:chatty_ai/Constants/custom_view_model.dart';

class AIAssistantsViewModel extends ViewModel {
  final List<String> filterList = [
    "All",
    "Writing",
    "Creative",
    "Business",
    "Social Media",
    "Developer",
    "Personal",
    "Others",
  ];
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void updateSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
