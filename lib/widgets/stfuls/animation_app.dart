import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef AnimationAppBuilder = Widget Function(
  BuildContext context,
  Animation animation,
);

class AnimationApp extends HookWidget {
  AnimationApp({
    Key? key,
    required this.animationController,
    required this.onCompleted,
    this.builder,
  })  : animation = Tween(
          end: 900.0,
          begin: 70.0,
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.fastOutSlowIn,
          ),
        ),
        super(key: key);

  final AnimationController animationController;
  final Animation animation;
  final VoidCallback onCompleted;
  final AnimationAppBuilder? builder;

  @override
  Widget build(BuildContext context) {
    animationController.addListener(() {
      if (animation.isCompleted) onCompleted();
    });

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 60.0),
          child: Container(
            height: animation.value,
            width: animation.value,
            decoration: BoxDecoration(
              color: const Color(0xFF3B2E6F),
              shape:
                  animation.value < 600 ? BoxShape.circle : BoxShape.rectangle,
            ),
            child: builder == null ? null : builder!(context, animation),
          ),
        );
      },
    );
  }
}
