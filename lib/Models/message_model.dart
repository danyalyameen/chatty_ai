class MessageModel {
  String? prompt;
  String? answer;

  MessageModel({this.prompt, this.answer});

  MessageModel.store(Map<String, dynamic> json) {
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
