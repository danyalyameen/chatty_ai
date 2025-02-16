import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? name;
  String? gender;
  Timestamp? dob;
  bool? profileCompleted;
  List<Chats>? chats;

  UserModel(
      {this.name, this.gender, this.dob, this.profileCompleted, this.chats});

  UserModel.store(Map<String, dynamic> json) {
    if (json['name'] != null) name = json['name'];
    if (json['gender'] != null) gender = json['gender'];
    if (json['dob'] != null) dob = json['dob'];
    if (json['profileCompleted'] != null) {
      profileCompleted = json['profileCompleted'];
    }
    if (json['chats'] != null) {
      chats = <Chats>[];
      json['chats'].forEach((v) {
        chats!.add(Chats.store(v));
      });
    }
  }

  Map<String, dynamic> receive() {
    final Map<String, dynamic> data = {};
    if (name != null) data['name'] = name;
    if (gender != null) data['gender'] = gender;
    if (dob != null) data['dob'] = dob;
    if (profileCompleted != null) data['profileCompleted'] = profileCompleted;
    if (chats != null) {
      data['chats'] = chats!.map((v) => v.receive()).toList();
    }
    return data;
  }
}

class Chats {
  String? title;
  List<Chat>? chat;

  Chats({this.title, this.chat});

  Chats.store(Map<String, dynamic> json) {
    title = json['title'];
    if (json['chat'] != null) {
      chat = <Chat>[];
      json['chat'].forEach((v) {
        chat!.add(Chat.store(v));
      });
    }
  }

  Map<String, dynamic> receive() {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    if (chat != null) {
      data['chat'] = chat!.map((v) => v.receive()).toList();
    }
    return data;
  }
}

class Chat {
  String? prompt;
  String? answer;

  Chat({this.prompt, this.answer});

  Chat.store(Map<String, dynamic> json) {
    prompt = json['prompt'];
    answer = json['answer'];
  }

  Map<String, dynamic> receive() {
    final Map<String, dynamic> data = {};
    data['prompt'] = prompt;
    data['answer'] = answer;
    return data;
  }
}
