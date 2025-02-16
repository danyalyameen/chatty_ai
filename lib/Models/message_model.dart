class MessageModel {
  String? text;
  bool? isUser;
  bool? responseGenerated;

  MessageModel({this.text, this.isUser, this.responseGenerated});

  MessageModel.store(Map<String, dynamic> json) {
    text = json['text'];
    isUser = json['isUser'];
    responseGenerated = json['responseGenerated'];
  }

  Map<String, dynamic> receive() {
    final Map<String, dynamic> data = {};
    data['text'] = text;
    data['isUser'] = isUser;
    data['responseGenerated'] = responseGenerated;
    return data;
  }
}
