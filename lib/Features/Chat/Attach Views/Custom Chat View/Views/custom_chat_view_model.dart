import 'package:chatty_ai/Constants/custom_view_model.dart';
import 'package:chatty_ai/Models/api_model.dart';
import 'package:chatty_ai/Models/message_model.dart';
import 'package:flutter/material.dart';

class CustomChatViewModel extends ViewModel {
  // Final Fields
  final TextEditingController _chatController = TextEditingController();
  // Get Final Fields
  TextEditingController get chatController => _chatController;
  // Non Final Fields
  List<MessageModel> messages = [];

  Future<String> startChat() async {
    ApiModel apiModel =
        await apiService.askQuestion(prompt: _chatController.text);
    _chatController.clear();
    notifyListeners();
    return apiModel.choices![0].message!.content!;
  }
}
