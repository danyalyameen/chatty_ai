class MessageModel {
  String? text;
  bool? isUser;

  MessageModel({this.text, this.isUser});

  MessageModel.store(Map<String, dynamic> json) {
    text = json['text'];
    isUser = json['isUser'];
  }

  Map<String, dynamic> receive() {
    final Map<String, dynamic> data = {};
    data['text'] = text;
    data['isUser'] = isUser;
    return data;
  }
}
