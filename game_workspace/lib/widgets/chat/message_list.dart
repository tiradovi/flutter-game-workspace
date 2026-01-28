import 'package:flutter/material.dart';

import '../../models/chat/chat_message.dart';
import 'chat_bubble.dart';
class MessageList extends StatelessWidget {
  final List<ChatMessage> messages;

  const MessageList({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: messages.isEmpty
            ? const Center(
          child: Text('대화를 시작하세요'),
        )
            : ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final msg = messages[index];
            return Padding(
                padding: const EdgeInsets.all(8),
                child: ChatBubble(message: msg)
            );
          },
        )

    );
  }
}
