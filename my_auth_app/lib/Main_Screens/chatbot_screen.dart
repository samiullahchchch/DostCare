import 'dart:convert';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  ChatUser myself = ChatUser(id: '1', firstName: 'Jaffer');
  ChatUser bot = ChatUser(id: '2', firstName: 'Dost For Care');

  List<ChatMessage> allMessages = [];
  List<ChatUser> typing = [];
  final oururl =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyC5d8Sg_FD6CaCw61_rI-NZOTELDqIicqQ";

  final header = {
    "Content-Type": "application/json",
  };

  Future<void> getdata(ChatMessage m) async {
    typing.add(bot);
    allMessages.insert(0, m);
    setState(() {});

    var data = {
      "contents": [
        {
          "parts": [
            {"text": m.text}
          ]
        }
      ]
    };

    try {
      final response = await http.post(
        Uri.parse(oururl),
        headers: header,
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);

        ChatMessage m1 = ChatMessage(
          text: result['candidates'][0]['content']['parts'][0]['text'],
          user: bot,
          createdAt: DateTime.now()

        );

        allMessages.insert(0,m1);
      } else {
        print("Error occurred: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
    typing.remove(bot);
    setState(() {      
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashChat(
        typingUsers: typing,
        currentUser: myself,
        onSend: (ChatMessage m) {
          getdata(m);
        },
        messages: allMessages,
      ),
    );
  }
}
