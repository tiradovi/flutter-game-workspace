import 'package:flutter/material.dart';

class MessageInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final bool isLoading;

  const MessageInput({
    super.key,
    required this.controller,
    required this.onSend,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextField(
          controller: controller,
          decoration: InputDecoration(
              enabled: !isLoading,
              hintText: '메세지 입력', border: const OutlineInputBorder()),
          onSubmitted: (_) => onSend(),
        )),
        IconButton(
          onPressed: isLoading ? null : onSend,
          icon: isLoading
              ? const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
              : const Icon(Icons.send),
        ),
      ],
    );
  }
}
