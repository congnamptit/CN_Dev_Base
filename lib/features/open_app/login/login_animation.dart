import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginAnimationPage extends HookWidget {
  const LoginAnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController();
    Animation<double> animation =
      Tween(
        end: 900.0,
        begin: 70.0,
      ).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Curves.bounceInOut,
        ),
    );
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: Container(
            height: animation.value,
            width: animation.value,
            decoration: BoxDecoration(
              color: const Color(0xFF3B2E6F),
              shape: animation.value < 600 ? BoxShape.circle : BoxShape.rectangle,
            ),
          ),
        );
      },
    );
  }
}
