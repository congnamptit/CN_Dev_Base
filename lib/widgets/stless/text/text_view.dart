import 'package:cn_base/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TextView extends HookWidget {
  const TextView(
    this.text, {
    Key? key,
    this.overflow,
    this.maxLines,
    this.defaultTextStyle,
    this.strutStyle,
    this.fontFamily,
    this.fontWeight,
    this.fontSize,
    this.fontColor,
    this.fontDarkColor,
    this.textAlign,
    this.textDecoration,
  }) : super(key: key);

  final String text;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextStyle? defaultTextStyle;
  final StrutStyle? strutStyle;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? fontColor;
  final Color? fontDarkColor;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _textStyle(context),
      overflow: overflow ?? TextOverflow.ellipsis,
      // Sử dụng dấu chấm lửng để
      // biết văn bản đã bị tràn
      textAlign: textAlign ?? TextAlign.start,
      textHeightBehavior: const TextHeightBehavior(
        applyHeightToFirstAscent: false,
        applyHeightToLastDescent: false,
      ),
      // Xác định cách áp dụng TextStyle.height trên và dưới văn bản
      strutStyle: strutStyle,
      // thiết lập các chỉ số bố cục dọc tối thiểu
      maxLines: maxLines,
    );
  }

  TextStyle? _textStyle(BuildContext context) {
    TextStyle? textStyle;

    textStyle = defaultTextStyle ?? Theme.of(context).textTheme.subtitle2;

    return textStyle?.copyWith(
      fontFamily: fontFamily,
      fontSize: fontSize ?? FontSize.large,
      fontWeight: fontWeight ?? FontWeight.normal,
      decoration: textDecoration,
      color: (Theme.of(context).brightness == Brightness.light)
          ? fontColor ?? AppColors.black
          : fontColor ?? AppColors.white,
    );
  }
}
