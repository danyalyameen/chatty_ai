import 'package:chatty_ai/Constants/custom_view_model.dart';
import 'package:chatty_ai/Models/api_model.dart';
import 'package:chatty_ai/Models/message_model.dart';
import 'package:chatty_ai/Models/user_model.dart';
import 'package:flutter/material.dart';

class CustomChatViewModel extends ViewModel {
  // Final Fields
  ValueNotifier<TextEditingController> chatController =
      ValueNotifier(TextEditingController());
  // Non Final Fields
  List<MessageModel> messages = [];
  List<Chat> chat = [];
  bool askPrompt = false;
  String prompt = "";
  bool _isLoading = false;
  // Get Non Final Fields
  bool get isLoading => _isLoading;

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
