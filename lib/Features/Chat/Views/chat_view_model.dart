import 'package:chatty_ai/Constants/custom_view_model.dart';
import 'package:chatty_ai/Constants/icons_path.dart';
import 'package:chatty_ai/Features/Account/View/account_view.dart';
import 'package:chatty_ai/Features/Chat/Views/chat_view.dart';
import 'package:chatty_ai/Features/History/Views/history_view.dart';
import 'package:flutter/material.dart';

class ChatViewModel extends ViewModel {
  // Non Final Fields
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  // List of Bottom Navigation Outline Icons
  final List<String> iconsOutline = [
    IconsPath.chatOutline,
    IconsPath.historyOutline,
    IconsPath.accountOutline,
  ];
  // List of Bottom Navigation Fill Icons
  final List<String> iconsFill = [
    IconsPath.chatFill,
    IconsPath.historyOutline,
    IconsPath.accountFill,
  ];
  // List of Bottom Navigation Titles
  final List<String> titles = ['Chat', 'History', 'Account'];

  // List of Bottom Navigaiton Views
  final List<Widget> navigationViews = [
    ChatUI(),
    HistoryView(),
    AccountView(),
  ];

  // To Change the Current Index of Bottom Navigation Bar
  void updateCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
