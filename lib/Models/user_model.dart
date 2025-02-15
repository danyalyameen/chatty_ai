import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? name;
  String? gender;
  Timestamp? dob;
  bool? profileCompleted;
  List<List<Chat>>? chats;

  UserModel({
    this.name,
    this.gender,
    this.dob,
    this.profileCompleted,
    this.chats,
  });

  factory UserModel.store(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      gender: json['gender'],
      dob: json['dob'],
      profileCompleted: json['profileCompleted'],
      chats: (json['chats'] as List)
          .map((chatList) =>
              (chatList as List).map((chat) => Chat.store(chat)).toList())
          .toList(),
    );
  }

  Map<String, dynamic> recieve() {
    return {
      'name': name,
      'gender': gender,
      'dob': dob,
      'profileCompleted': profileCompleted,
      'chats': chats == null
          ? []
          : chats!
              .map(
                  (chatList) => chatList.map((chat) => chat.receive()).toList())
              .toList(),
    };
  }
}

class Chat {
  String? prompt;
  String? answer;

  Chat({
    this.prompt,
    this.answer,
  });

  factory Chat.store(Map<String, dynamic> json) {
    return Chat(
      prompt: json['prompt'],
      answer: json['answer'],
    );
  }

  Map<String, dynamic> receive() {
    return {
      'prompt': prompt,
      'answer': answer,
    };
  }
}
