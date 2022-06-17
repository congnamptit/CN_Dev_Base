import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum IndicatorColor {
  none,
  white,
  black,
}

class Indicator extends ConsumerWidget {
  const Indicator({
    Key? key,
    this.radius = 10,
    this.color = IndicatorColor.none,
  }) : super(key: key);

  final double radius;
  final IndicatorColor color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoTheme(
      data: (color != IndicatorColor.none)
          ? CupertinoTheme.of(context).copyWith(
              brightness: (color == IndicatorColor.black)
                  ? Brightness.light
                  : Brightness.dark)
          : CupertinoTheme.of(context),
      child: CupertinoActivityIndicator(
        radius: radius,
      ),
    );
  }
}
