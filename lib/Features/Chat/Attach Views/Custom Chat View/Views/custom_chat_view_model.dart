import 'dart:developer';
import 'package:animated_text_kit/animated_text_kit.dart';
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
  final AnimatedTextController animatedTextController =
      AnimatedTextController();
  // Get Final Feilds
  ScrollController get listViewController => _listViewController;
  // Non Final Fields
  List<MessageModel> messages = [];
  List<Chat> chat = [];
  bool askPrompt = false;
  String prompt = "";
  int? maxLines = 1;
  bool _showLoading = false;
  bool showLoadingForFirestore = false;
  // Get Non Final Fields
  bool get showLoading => _showLoading;

  // Start Chat
  void startChat() async {
    if (chatController.value.text.isNotEmpty) {
      // Prompt Storing
      prompt = chatController.value.text;
      // Message Adding
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
      // Show Loading
      _showLoading = true;
      notifyListeners();
      // Fetch Response
      ApiModel apiModel = await apiService.askQuestion(prompt: prompt);
      // Add Response
      messages.removeLast();
      messages.add(
        MessageModel(
          text: apiModel.choices![0].message!.content!,
          isUser: false,
        ),
      );
      // Hide Loading
      _showLoading = false;
      notifyListeners();
      chat.add(
          Chat(prompt: prompt, answer: apiModel.choices![0].message!.content!));
    }
  }

  // On Back Button Function
  void onBackButton() async {
    if (chat.isNotEmpty) {
      try {
        showLoadingForFirestore = true;
        notifyListeners();
        await firestoreService.addChat(chats: chat);
        showLoadingForFirestore = false;
        notifyListeners();
      } catch (e) {
        showLoadingForFirestore = false;
        notifyListeners();
        log(e.toString());
      }
    }
  }
}
