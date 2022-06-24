import 'package:cn_base/core/view_model/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../message.dart';

final messageVMProvider = Provider.autoDispose<MessageVMProvider>(
  (ref) => MessageVMProvider(ref.read),
);

class MessageVMProvider extends ViewModel {
  MessageVMProvider(Reader read) : super(read);

  final TextEditingController textEditingController = TextEditingController();
  bool isWriting = false;
  final List<Message> listMessage = [];

  final animationCtrl =
  useAnimationController(duration: const Duration(milliseconds: 800));

  useEffect(){
    animationCtrl.forward();
    return animationCtrl.dispose();
  }

  void submitMsg(String txt) async {
    textEditingController.clear();
    isWriting = false;
    updateState();

    Message message = Message(
        txt: txt,
        animationController: animationCtrl,
    );
    listMessage.insert(0, message);
    updateState();

    message.animationController.forward();
  }
}
