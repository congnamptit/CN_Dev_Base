import 'package:flutter/material.dart';

class CustomTransition extends PageTransitionsBuilder {
  CustomTransition({
    required this.child,
  });

  final Widget child;

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60.0),
      child: Container(
        height: animation.value,
        width: animation.value,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: animation.value < 600 ? BoxShape.circle : BoxShape.rectangle,
        ),
        child: child,
      ),
    );
  }
}
