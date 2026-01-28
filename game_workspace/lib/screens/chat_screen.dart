import 'package:flutter/material.dart';
import 'package:game_workspace/models/chat/chat_message.dart';
import 'package:game_workspace/models/chat/chat_request.dart';
import 'package:game_workspace/services/chat_service.dart';
import 'package:game_workspace/widgets/chat/message_input.dart';
import 'package:game_workspace/widgets/chat/message_list.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController controller = TextEditingController();
  List<ChatMessage> messages = [];
  bool loading = false;

  // int? conversationId;
  List<Map<String, String>> conversationHistory = [];

  void sendMessage() async {
    String text = controller.text;
    if (text.isEmpty) return;

    setState(() {
      messages.add(ChatMessage(text, true, DateTime.now()));
      loading = true;
    });
    controller.clear();

    try {
      final response =
          await ChatService.AIsendMessage(text, conversationHistory);
      conversationHistory.add({'message': text, 'isUser': 'true'});
      conversationHistory.add({'message': response, 'isUser': 'false'});

      setState(() {
        messages.add(ChatMessage(response, false, DateTime.now()));
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("오류 $e")));
    }
  }

/*    try {
      final request = ChatRequest('user123', text, conversationId);
      final response = await ChatService.sendMessage(request);

      conversationId = response.conversationId;

      setState(() {
        messages.add(ChatMessage(response.message, false, DateTime.now()));
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('오류:$e')));
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('채팅'),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            MessageList(messages: messages),
            if (loading)
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text("생각중"),
              ),
            Padding(
                padding: const EdgeInsets.all(8),
                child: MessageInput(
                    controller: controller,
                    onSend: sendMessage,
                    isLoading: loading))
          ],
        ));
  }
}
