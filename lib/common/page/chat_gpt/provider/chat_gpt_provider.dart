import 'dart:async';
import 'dart:convert';

import 'package:dognect/common/data/chat_gpt_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../model/chat_gpt_model.dart';

class ChatGptProvider with ChangeNotifier {
  final textController = TextEditingController();
  String apiKey = CHAT_GPT_KEY;
  bool widgetCheck = false;
  String query = '';
  String role = '';
  StreamController<ChatGptModel> chatStreamController = StreamController();

  List<String> chatList = [];
  List<String> userList = [];

  String? chatGptValue(String value) {
    query = value;

    return query;
  }

  void addChat(ChatGptModel chat) {
    if (!chatStreamController.isClosed) {
      chatStreamController.sink.add(chat);
    }
  }

  void setText() {
    textController.clear();
    userList.add(query);
    notifyListeners();
  }


  Future<void> generateText() async {

    final requestBody = {
      'model': 'gpt-3.5-turbo',
      'messages': [
        {'role': 'user', 'content': query}
      ]
    };
    final encodedParams = json.encode(requestBody);
    var response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $apiKey',
      },
      body: encodedParams,
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      ChatGptModel chatGptModel = ChatGptModel.fromJson(data);
      role = data['choices'][0]['message']['role'];
      chatList.add(chatGptModel.content!);
      addChat(chatGptModel); // chatStreamController.sink.add(chatGptModel) 대신 addChat(chatGptModel) 호출
      widgetCheck = true;
      notifyListeners();
    } else {
      print(response.statusCode);
      notifyListeners();
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textController;
    chatStreamController;
  }
}