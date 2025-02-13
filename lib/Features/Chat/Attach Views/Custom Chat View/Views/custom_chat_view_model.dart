import 'package:chatty_ai/Constants/custom_view_model.dart';
import 'package:chatty_ai/Models/api_model.dart';
import 'package:chatty_ai/Models/message_model.dart';
import 'package:flutter/material.dart';

class CustomChatViewModel extends ViewModel {
  // Final Fields
  ValueNotifier<TextEditingController> chatController =
      ValueNotifier(TextEditingController());
  // Non Final Fields
  List<MessageModel> messages = [];
  bool askPrompt = false;
  String prompt = "";

  void startChat()async {
    if (chatController.value.text.isNotEmpty) {
      prompt = chatController.value.text;
      askPrompt = true;
      chatController.value.clear();
      messages.add(MessageModel(
        text: chatController.value.text,
        isUser: true,
      ),);
      notifyListeners();
          ApiModel chat = await apiService.askQuestion(prompt: prompt);
      messages.add(MessageModel(text: chat.choices![0].message!.content, isUser: false,));
    }
  }
}
