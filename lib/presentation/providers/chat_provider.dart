import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_or_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController controller = ScrollController();
  final GetYesOrNoAnswer getYesorNoAnswer = GetYesOrNoAnswer();

  List<Message> messages = [
    Message(text: "Hello", fromWho: FromWho.me),
    Message(text: "Hello my love", fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    text = text.trim();
    if(text.isEmpty) return;
    final Message newMessage = Message(text: text, fromWho: FromWho.me);
    messages.add(newMessage);
    if(text.endsWith('?')) await herReply();
    notifyListeners();
    moveScrollBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesorNoAnswer.getAnswer();
    messages.add(herMessage);
    notifyListeners();
    moveScrollBottom();
  }

  void moveScrollBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    controller.animateTo(
      controller.position.maxScrollExtent, 
      duration: const Duration( milliseconds: 500 ), 
      curve: Curves.easeInOut
    );
  }

}