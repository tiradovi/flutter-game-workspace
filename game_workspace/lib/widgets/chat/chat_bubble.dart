import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/chat/chat_message.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          message.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: message.isUser ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            message.message,
            style: TextStyle(
              color: message.isUser ? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
