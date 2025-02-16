import 'package:chatty_ai/Constants/custom_view_model.dart';
import 'package:chatty_ai/Models/api_model.dart';
import 'package:chatty_ai/Models/message_model.dart';
import 'package:chatty_ai/Models/user_model.dart';
import 'package:flutter/material.dart';

class CustomChatViewModel extends ViewModel {
  // Final Fields
  final ValueNotifier<TextEditingController> chatController =
      ValueNotifier(TextEditingController());
  final ScrollController _listViewController = ScrollController();
  // Get Final Feilds
  ScrollController get listViewController => _listViewController;
  // Non Final Fields
  List<MessageModel> messages = [];
  List<Chat> chat = [];
  bool askPrompt = false;
  String prompt = "";
  bool _isLoading = false;
  bool stopGenerating = false;
  // Get Non Final Fields
  bool get isLoading => _isLoading;

  void scrollToBottom() {
    Future.delayed(Duration(milliseconds: 300), () {
      if (_listViewController.hasClients) {
        _listViewController.animateTo(
          _listViewController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void startChat() async {
    if (chatController.value.text.isNotEmpty) {
      prompt = chatController.value.text;
      askPrompt = true;
      chatController.value.clear();
      messages.add(
        MessageModel(
          text: prompt,
          isUser: true,
        ),
      );
      messages.add(
        MessageModel(
          text: "Loading",
          isUser: false,
        ),
      );
      _isLoading = true;
      notifyListeners();
      ApiModel apiModel = await apiService.askQuestion(prompt: prompt);
      messages.removeLast();
      messages.add(
        MessageModel(
          text: apiModel.choices![0].message!.content!,
          isUser: false,
        ),
      );
      _isLoading = false;
      notifyListeners();
      chat.add(
          Chat(prompt: prompt, answer: apiModel.choices![0].message!.content!));
    }
  }
}
