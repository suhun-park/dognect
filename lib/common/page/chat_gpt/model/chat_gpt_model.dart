class ChatGptModel {
String? role;
String? content;

ChatGptModel({this.role, this.content});

factory ChatGptModel.fromJson(Map<String, dynamic> json) {
  final message = json['choices'][0]['message'];
  return ChatGptModel(
    role: message['role'],
    content: message['content'],
  );
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['role'] = role;
  data['content'] = content;
  return data;
}
}