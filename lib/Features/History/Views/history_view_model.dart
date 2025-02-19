import 'package:chatty_ai/Constants/custom_view_model.dart';

class HistoryViewModel extends ViewModel {
  // Non Final Fields
  bool showLoading = false;

  // delete All Chats
  void deleteAllChats() async {
    navigationService.back();
    await firestoreService.deleteAllChats();
    notifyListeners();
  }

  // delete Chat
  void deleteChat({required int index}) async {
    navigationService.back();
    await firestoreService.deleteChat(index: index);
    notifyListeners();
  }
}
