import 'package:chatty_ai/Constants/custom_view_model.dart';
import 'package:chatty_ai/Models/user_model.dart';
import 'package:flutter/material.dart';

class SearchViewModel extends ViewModel {
  // Final Fields
  final TextEditingController _searchController = TextEditingController();
  final FocusNode searchNode = FocusNode();
  // Get Final Fields
  TextEditingController get searchController => _searchController;
  // Non Final Fields
  List<Chats> searchResults = [];
  List<Chats> allChats = [];

  // Get Search Results
  void getSearchResults() async {
    searchResults = [];
    if (allChats.isNotEmpty && _searchController.text.isNotEmpty) {
      searchResults = allChats.where(
        (element) {
          return element.title
              .toString()
              .toLowerCase()
              .contains(_searchController.text.toLowerCase());
        },
      ).toList();
    }
    notifyListeners();
  }

  // Get All the Chats
  void getChats() async {
    allChats = await firestoreService.getChat();
  }

  // delete Chat
  void deleteChat({required int index}) async {
    await firestoreService.deleteChat(index: index);
    navigationService.back();
    notifyListeners();
  }
}
