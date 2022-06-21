import 'package:flutter/material.dart';

import '../text/text_view_app.dart';

class ButtonBottom extends StatelessWidget {
  const ButtonBottom({
    Key? key,
    required this.title,
    required this.boxShadow,
    required this.colors,
  }) : super(key: key);

  final String title;
  final BoxShadow boxShadow;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        height: 55.0,
        width: 600.0,
        child: TextViewApp(
          title: title,
          letterSpacing: 0.2,
          fontWeight: FontWeight.w800,
        ),
        alignment: FractionalOffset.center,
        decoration: BoxDecoration(
          boxShadow: [boxShadow],
          borderRadius: BorderRadius.circular(30.0),
          gradient: LinearGradient(colors: colors),
        ),
      ),
    );
  }
}
