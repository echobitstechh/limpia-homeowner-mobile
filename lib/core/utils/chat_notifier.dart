import 'package:flutter/material.dart';

class Message {
  final String text;
  final bool isMe;
  Message({required this.text, required this.isMe});
}

class MessageProvider with ChangeNotifier {
  List<Message> _messages = [];
  List<Message> get messages => _messages;

  void addMessage(String text, bool isMe) {
    _messages.add(Message(text: text, isMe: isMe));
    notifyListeners();
  }

  void clearMessages() {
    _messages.clear();
    notifyListeners();
  }
}
