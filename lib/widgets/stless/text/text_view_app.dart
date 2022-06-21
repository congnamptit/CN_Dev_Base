import 'package:flutter/material.dart';

class TextViewApp extends StatelessWidget {
  const TextViewApp({
    Key? key,
    required this.title,
    this.fontSize,
    this.letterSpacing,
    this.fontWeight,
    this.color,
  }) : super(key: key);

  final String title;
  final double? fontSize;
  final double? letterSpacing;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: fontSize ?? 18,
        fontWeight: fontWeight ?? FontWeight.w900,
        fontFamily: "Sans",
        letterSpacing: letterSpacing ?? 0.6,
      ),
    );
  }
}
