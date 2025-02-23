import 'dart:async';
import 'dart:developer';
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
  int? maxLines = 1;
  bool _showLoading = false;
  bool showLoadinForFirestore = false;
  bool shouldAutoScroll = true;
  Timer? scrollTimer;
  // Get Non Final Fields
  bool get showLoading => _showLoading;

  // Scroll to End
  Future<void> scrollToEnd() async {
    if (!listViewController.hasClients) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (listViewController.hasClients) {
        listViewController.animateTo(
          listViewController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  // Scroll Listener
  void scrollListener() {
    if (listViewController.hasClients) {
      var currentScroll = listViewController.position.pixels;
      var maxScroll = listViewController.position.maxScrollExtent;
      // Check if user scrolled up (with 80px tolerance)
      if ((maxScroll - currentScroll) > 80) {
        currentScroll = maxScroll;
        shouldAutoScroll = false;
        notifyListeners();
        scrollTimer?.cancel();
        scrollTimer = null;
      }
    }
  }

  // Auto Scroll
  void startAutoScroll() {
    if (scrollTimer != null) return;
    scrollTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      scrollToEnd();
      scrollListener();
    });
  }

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
        showLoadinForFirestore = true;
        notifyListeners();
        await firestoreService.addChat(chats: chat);
        showLoadinForFirestore = false;
        notifyListeners();
      } catch (e) {
        showLoadinForFirestore = false;
        notifyListeners();
        log(e.toString());
      }
    }
  }
}
