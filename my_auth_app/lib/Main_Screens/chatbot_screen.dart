import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore integration

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  List<Map<String, String>> allMessages = []; // List to store messages
  final TextEditingController _textController = TextEditingController();

  final String botId = '2';
  final String userId = '1';

  final String ourUrl =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyC5d8Sg_FD6CaCw61_rI-NZOTELDqIicqQ";

  final Map<String, String> header = {
    "Content-Type": "application/json",
  };

  final int maxWordLimit = 200; // Max word limit
  int currentWordCount = 0; // Current word count

  @override
  void initState() {
    super.initState();
    _loadPreviousChats(); // Load previous chats when screen is opened

  }

  Future<void> _loadPreviousChats() async {
    // Fetch the saved messages from Firestore
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('chats')
        .orderBy('timestamp')
        .get();

    List<Map<String, String>> loadedMessages = [];
    for (var doc in snapshot.docs) {
      loadedMessages.add({
        'sender': doc['sender'],
        'message': doc['message'],
      });
    }

    setState(() {
      allMessages = loadedMessages.reversed
          .toList(); // Reverse the list to show the most recent messages at the bottom
    });
  }

  Future<void> getBotResponse(String userMessage) async {
    var data = {
      "contents": [
        {
          "parts": [
            {"text": userMessage}
          ]
        }
      ]
    };

    setState(() {
      allMessages.insert(0, {"sender": userId, "message": userMessage});
      // Add "thinking" message when waiting for bot response
      allMessages.insert(
          0, {"sender": botId, "message": "Dost For Care is thinking..."});
    });

    try {
      final response = await http.post(
        Uri.parse(ourUrl),
        headers: header,
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        var botMessage = result['candidates'][0]['content']['parts'][0]['text'];

        setState(() {
          // Replace "thinking" message with the actual bot response
          allMessages.removeAt(0);
          allMessages.insert(0, {"sender": botId, "message": botMessage});
        });

        // Save the user and bot responses to Firestore
        await _saveMessageToFirestore(userMessage, userId); // Save user message
        await _saveMessageToFirestore(botMessage, botId); // Save bot response
      } else {
        print("Error occurred: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> _saveMessageToFirestore(String message, String senderId) async {
    await FirebaseFirestore.instance.collection('chats').add({
      'sender': senderId,
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  String _sanitizeMessage(String message) {
    return message.replaceAll(RegExp(r'\s+'), ' ').trim();
  }

  void _updateWordCount(String text) {
    setState(() {
      currentWordCount = text
          .trim()
          .split(RegExp(r'\s+'))
          .where((word) => word.isNotEmpty)
          .length;
    });
  }

  bool _isWordLimitExceeded() {
    return currentWordCount > maxWordLimit;
  }

  void _handleSendMessage() {
    String sanitizedMessage = _sanitizeMessage(_textController.text);

    if (sanitizedMessage.isEmpty) {
      return; // Do nothing if the message is empty
    }

    if (_isWordLimitExceeded()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Message exceeds the 200-word limit."),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Send the message and save it to Firestore
    getBotResponse(sanitizedMessage);
    _textController.clear();
    _updateWordCount(''); // Reset word count
  }

  Future<void> _saveCurrentSession() async {
    for (var message in allMessages) {
      await _saveMessageToFirestore(message['message']!, message['sender']!);
    }
  }

  void _handleNewChat() {
    _saveCurrentSession(); // Save current session before clearing
    setState(() {
      allMessages.clear(); // Clear the current chat
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Chat With DostCare",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, // Newest messages at the bottom
              itemCount: allMessages.length,
              itemBuilder: (context, index) {
                final message = allMessages[index];
                final isBot = message['sender'] == botId;

                return Align(
                  alignment:
                      isBot ? Alignment.centerLeft : Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: isBot ? Colors.grey[300] : Colors.blue[300],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Display the bot's name above the reply
                        if (isBot)
                          Text(
                            "Dost For Care",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                              fontSize: 14,
                            ),
                          ),
                        // Display the bot's or user's message
                        Text(
                          message['message'] ?? '',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Display word counter
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "$currentWordCount/$maxWordLimit words",
                    style: TextStyle(
                      color: _isWordLimitExceeded() ? Colors.red : Colors.grey,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        maxLines: null,
                        decoration: const InputDecoration(
                          hintText: 'Type your message...',
                        ),
                        onChanged: (text) {
                          _updateWordCount(text);
                        },
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: _handleSendMessage,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
