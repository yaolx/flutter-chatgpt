class ChatMessage {
  ChatMessage(this.content, this.isUserMessage, this.type);

  final String content;
  final bool isUserMessage;
  final String type;

  ChatMessage.fromJson(Map<String, dynamic> json)
      : content = json['content'],
        isUserMessage = json['isUserMessage'],
        type = json['type'];

  Map<String, dynamic> toJson(model) => {
        'content': content,
        'isUserMessage': isUserMessage,
        'type': type,
      };

  @override
  String toString() {
    return "ChatMessage(content: $content, isUserMessage: $isUserMessage, type: $type)";
  }
}
