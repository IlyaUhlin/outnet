import 'package:flutter/material.dart';
import 'package:outnet/models/message_model.dart';

import '../../app_res/AppColors.dart';

class MessageWidgetCreator {
  late final Widget _messageWidget;

  MessageWidgetCreator(String messageContent, MessageType messageType) {
    bool isLocalType = messageType == MessageType.local;
    _messageWidget = Align(
      alignment: isLocalType ? Alignment.topLeft : Alignment.topRight,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.orange),
          color: isLocalType ? Colors.black : AppColors.darkGrey,
        ),
        padding: const EdgeInsets.all(16),
        child: Text(
          messageContent,
          style: const TextStyle(color: AppColors.orange, fontSize: 15),
        ),
        margin: const EdgeInsets.only(bottom: 10),
      ),
    );
  }

  Widget get messageWidget {
    return _messageWidget;
  }
}
