import 'package:flutter_chatgpt/api/chat.dart';
import 'package:flutter_chatgpt/model/chat.dart';
import 'package:flutter_chatgpt/pages/message/bubble.dart';
import 'package:flutter_chatgpt/pages/message/message_chat.dart';
import 'package:flutter_chatgpt/utils/cahce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatgpt/routes/index.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

final Uri _url = Uri.parse('https://yaolx.github.io/poetry');

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _messages = <ChatMessage>[
    ChatMessage('Hello, how can I help?', false),
  ];
  var _awaitingResponse = false;
  late ChatApi chatApi = ChatApi(AppCache.openAiApiKey);

  Future<void> _onSubmitted(String message) async {
    setState(() {
      _messages.add(ChatMessage(message, true));
      _awaitingResponse = true;
    });
    final response = await chatApi.completeChat(_messages);
    setState(() {
      _messages.add(ChatMessage(response, false));
      _awaitingResponse = false;
    });
  }

  Future<void> _launchUrl() async {
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat1'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              if (kIsWeb) {
                _launchUrl();
              } else {
                Routes.navigateTo(context, Routes.poetry);
              }
            },
            icon: const Icon(Icons.list),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ..._messages.map(
                  (msg) => MessageBubble(
                    content: msg.content,
                    isUserMessage: msg.isUserMessage,
                  ),
                ),
              ],
            ),
          ),
          MessageChat(
            onSubmitted: _onSubmitted,
            awaitingResponse: _awaitingResponse,
          ),
        ],
      ),
    );
  }
}
