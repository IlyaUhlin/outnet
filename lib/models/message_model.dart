enum MessageType { local, server }

class ChatMessage {
  String messageContent;
  MessageType messageType;

  ChatMessage({
    required this.messageContent,
    required this.messageType,
  });
}
