import 'package:flutter/material.dart';

import '../app_res/AppColors.dart';
import '../message_widget_creator.dart';
import '../models/message_model.dart';
import '../repository.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();

  _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  TextEditingController myController = TextEditingController();

  @override
  void initState() {
    Repository.initListenConnection(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) => _scrollToBottom());
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                Expanded(child: buildListView()),
                buildInputField(),
              ],
            ),
          )),
    );
  }

  void addReceivedMessagesToList() {}

  Widget buildListView() {
    return ListView.builder(
        controller: _scrollController,
        shrinkWrap: true,
        itemCount: Repository.getListMessages().length,
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        itemBuilder: (context, index) {
          List<ChatMessage> messages = Repository.getListMessages();
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              messages[index].messageType == MessageType.local
                  ? MessageWidgetCreator.localMessage(
                          messages[index].messageContent)
                      .messageWidget
                  : MessageWidgetCreator.serverMessage(
                          messages[index].messageContent)
                      .messageWidget
            ],
          );
        });
  }

  Stack buildInputField() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(40.0),
              border: Border.all(color: AppColors.orange),
            ),
            padding:
                const EdgeInsets.only(left: 20, right: 5, top: 5, bottom: 5),
            width: double.infinity,
            child: Row(
              children: <Widget>[
                Expanded(child: buildTextField()),
                const SizedBox(
                  width: 15,
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        border: Border.all(color: AppColors.orange)),
                    child: buildFAB()),
              ],
            ),
          ),
        )
      ],
    );
  }

  TextField buildTextField() {
    return TextField(
      controller: myController,
      cursorColor: AppColors.orange,
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: 4,
      style: const TextStyle(color: AppColors.orange),
      decoration: InputDecoration(
          hintText: "Write message",
          hintStyle: TextStyle(
            color: Colors.orange.withOpacity(0.7),
          ),
          border: InputBorder.none),
    );
  }

  FloatingActionButton buildFAB() {
    return FloatingActionButton(
      mini: true,
      onPressed: () {
        String text = myController.text;
        setState(() {
          if (text.isNotEmpty) {
            Repository.addChatMessageToList(ChatMessage(
                messageContent: text, messageType: MessageType.local));
            Repository.sendMessage(text);
            myController.text = "";
          }
        });
      },
      child: const Icon(
        Icons.send,
        color: AppColors.orange,
        size: 18,
      ),
      backgroundColor: Colors.black,
      elevation: 0,
    );
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
}
