import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import 'chat_view.dart';

class ChatViewModel extends BaseViewModel {

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  List<Message> newMessage = [
    Message(
        text: "Hi",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: "Hello",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: true),
    Message(
        text: "how was your day",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: "Hey, I need your help. I was wondering if it's possible to book",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: true),
    Message(
        text: "Hi",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: "Hello, any update?",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: "Hi, I would like to book a table for two at your tonight.",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: true),
    Message(
        text: "Hi",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: "How far",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: "Di you order anything.",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: "No i did not",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
  ];


  void sendMessage(String message) async {
    if (message.isNotEmpty) {
      // await _pubnub.publish().c('chat_channel').message({'text': message}).send();

      newMessage.add(
        Message(text: message, date: DateTime.now(), isSentByMe: true),
      );
      messageController.clear();
      notifyListeners();

      Future.delayed(Duration(milliseconds: 300), () {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

}
