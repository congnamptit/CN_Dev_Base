import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CountDownTime extends StatefulHookWidget {
  const CountDownTime({
    Key? key,
    this.secondRemaining,
    this.whenTimeExpires,
    this.countDownFormatter,
    this.countDownTimerStyle,
  }) : super(key: key);
  final int? secondRemaining;
  final Function? whenTimeExpires;
  final Function? countDownFormatter;
  final TextStyle? countDownTimerStyle;

  @override
  State<StatefulWidget> createState() => _CountDownTime();
}

class _CountDownTime extends State<CountDownTime>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Duration duration;

  String get timerDisplayString {
    Duration duration = _controller.duration! * _controller.value;
    return widget.countDownFormatter != null
        ? widget.countDownFormatter!(duration.inSeconds)
        : formatHHMMSS(duration.inSeconds);
  }

  @override
  void initState() {
    super.initState();
    duration = Duration(seconds: widget.secondRemaining!);
    _controller = AnimationController(
      vsync: this,
      duration: duration,
    );
    _controller.reverse(from: widget.secondRemaining!.toDouble());
    _controller.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed ||
            status == AnimationStatus.dismissed) {
          widget.whenTimeExpires;
        }
      },
    );
  }

  @override
  void didUpdateWidget(CountDownTime oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.secondRemaining != oldWidget.secondRemaining) {
      setState(
        () {
          duration = Duration(seconds: widget.secondRemaining!);
          _controller.dispose();
          _controller = AnimationController(
            vsync: this,
            duration: duration,
          );
          _controller.reverse(from: widget.secondRemaining!.toDouble());
          _controller.addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                widget.whenTimeExpires!();
              } else if (status == AnimationStatus.dismissed) {
                debugPrint("Animation Complete");
              }
            },
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, Widget? child) {
          return Text(
            timerDisplayString,
            style: widget.countDownTimerStyle,
          );
        },
      ),
    );
  }
}

String formatHHMMSS(int seconds) {
  int hours = (seconds / 3600).truncate();
  seconds = (seconds % 3600).truncate();
  int minutes = (seconds / 60).truncate();

  String hoursStr = (hours).toString().padLeft(2, '0');
  String minutesStr = (minutes).toString().padLeft(2, '0');
  String secondsStr = (seconds % 60).toString().padLeft(2, '0');

  if (hours == 0) {
    return "$minutesStr:$secondsStr";
  }

  return "$hoursStr:$minutesStr:$secondsStr";
}
