import 'package:flutter/material.dart';

import 'app_res/AppColors.dart';

class MessageWidgetCreator {
  late final Widget _messageWidget;

  MessageWidgetCreator.localMessage(String messageContent) {
    _messageWidget = Align(
      alignment: Alignment.topLeft,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.orange),
          color: Colors.black,
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

  MessageWidgetCreator.serverMessage(String messageContent) {
    _messageWidget = Align(
      alignment: Alignment.topRight,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.orange),
          color: AppColors.darkGrey,
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
