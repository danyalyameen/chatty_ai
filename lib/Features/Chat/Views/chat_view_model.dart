import 'package:chatty_ai/Constants/custom_view_model.dart';
import 'package:chatty_ai/Constants/icons_path.dart';
import 'package:chatty_ai/Features/AI%20Assistants/Views/ai_assistants_view.dart';
import 'package:chatty_ai/Features/Chat/Views/chat_view.dart';

class ChatViewModel extends ViewModel {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  // List of Bottom Navigation Outline Icons
  final List<String> iconsOutline = [
    IconsPath.chatOutline,
    IconsPath.aiAssistantsOutline,
    IconsPath.historyOutline,
    IconsPath.accountOutline,
  ];
  // List of Bottom Navigation Fill Icons
  final List<String> iconsFill = [
    IconsPath.chatFill,
    IconsPath.aiAssitantsFill,
    IconsPath.historyOutline,
    IconsPath.accountFill,
  ];
  // List of Bottom Navigation Titles
  final List<String> titles = ['Chat', 'Category', 'History', 'Account'];

  // List of Bottom Navigaiton Views
  final List navigaitonViews = [
    ChatUI(),
    AIAssistantsView(),
    ChatUI(),
    AIAssistantsView(),
  ];

  // To Change the Current Index of Bottom Navigation Bar
  void updateCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
