import 'package:cn_base/features/brand/view_model/message_view_model.dart';
import 'package:cn_base/features/model/brand_model.dart';
import 'package:cn_base/theme/theme.dart';
import 'package:cn_base/widgets/stless/assets_gen/assets.gen.dart';
import 'package:cn_base/widgets/stless/text/text_view_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PrivateMessage extends HookConsumerWidget {
  PrivateMessage(this.brand, {Key? key}) : super(key: key);

  final Brand brand;
  bool isWriting = false;
  final List<Message> listMessage = [];
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.read(messageVMProvider);
    final animationCtrl =
    useAnimationController(duration: const Duration(milliseconds: 800));

    useEffect(() {
      animationCtrl.forward();

      return null;
    }, [animationCtrl]);

    void submitMsg(String txt) async {
      textEditingController.clear();
      isWriting = false;
      vm.updateState();

      Message message = Message(
        txt: txt,
        animationController: animationCtrl,
      );
      listMessage.insert(0, message);
      vm.updateState();

      message.animationController.forward();
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        title: TextViewApp(
          title: brand.name,
          color: Colors.black54,
        ),
        iconTheme: const IconThemeData(color: Color(0xFF6991C7)),
        centerTitle: true,
        backgroundColor: AppColors.white,
      ),
      body: Column(
        children: [
          Flexible(
            child: vm.listMessage.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (_, int index) => vm.listMessage[index],
                    itemCount: vm.listMessage.length,
                    reverse: true,
                    padding: const EdgeInsets.all(10),
                  )
                : const NoMessage(),
          ),
          const Divider(height: 1.5),
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 1,
                    color: Colors.black12,
                  )
                ]),
            child: IconTheme(
              data: IconThemeData(
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: TextField(
                          controller: vm.textEditingController,
                          onChanged: (String txt) {
                            isWriting = txt.isNotEmpty;
                          },
                          onSubmitted: submitMsg,
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.black26,
                            ),
                            hintText: 'Enter some text to send a message',
                          ),
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        child: Theme.of(context).platform == TargetPlatform.iOS
                            ? CupertinoButton(
                                child: const Text('Submit'),
                                onPressed: isWriting
                                    ? () => submitMsg(
                                        textEditingController.text,)
                                    : null,
                              )
                          : IconButton(
                              icon: const Icon(Icons.message),
                              onPressed: isWriting
                                  ? () => submitMsg(textEditingController.text)
                                  : null,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Message extends StatelessWidget {
  const Message(
      {Key? key, required this.txt, required this.animationController})
      : super(key: key);

  final String txt;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    const String defaultUserName = 'Alisa Heart';
    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
      axisAlignment: 0,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 18),
              child: CircleAvatar(
                backgroundColor: Colors.indigoAccent,
                child: Text(defaultUserName[0]),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextViewApp(title: defaultUserName),
                  const SizedBox(height: 6),
                  TextViewApp(title: txt),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NoMessage extends StatelessWidget {
  const NoMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Opacity(
          opacity: 0.5,
          child: Image.asset(
            Assets.imgllustration.ilustrasiMessage.path,
            height: 220,
          ),
        ),
        const TextViewApp(
          title: 'Not Have Message',
          fontWeight: FontWeight.w300,
          color: Colors.black12,
          fontSize: 16,
        ),
      ],
    );
  }
}
