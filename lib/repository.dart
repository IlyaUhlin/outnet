import 'package:flutter/foundation.dart';

import 'connection.dart';
import 'models/message_model.dart';

class Repository {
  static final List<ChatMessage> _messages = [];

  static void initListenConnection(Function() update) {
    if (Connection.hasConnected) {
      Connection.startListen((dataRetrieved) => {
            _messages.add(ChatMessage(
                messageContent: dataRetrieved,
                messageType: MessageType.server)),
            update.call()
          });
    } else {
      if (kDebugMode) {
        print("is not connected");
      }
    }
  }

  static List<ChatMessage> getListMessages() {
    return _messages;
  }

  static void sendMessage(String data) {
    Connection.write(data);
  }

  static void addChatMessageToList(ChatMessage chatMessage) {
    _messages.add(chatMessage);
  }
}
