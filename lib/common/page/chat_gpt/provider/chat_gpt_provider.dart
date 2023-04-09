import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class ChatGptProvider with ChangeNotifier{
  String apiKey = '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';
  String chatText = "";
  bool widgetCheck = false;
  String query = '';
  String? chatGptValue (String value) {
    query = value;
    print(query);
    notifyListeners();
    return query;
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
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      chatText = data['choices'][0]['message']['content'];
      widgetCheck = true;
      notifyListeners();
    } else {
      print(chatText = "Error: ${response.reasonPhrase}");
      notifyListeners();
    }

  }
}