import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// [useDeBouncerCallback] is used to prevent repeated calls to a method.
/// It will waits for a certain period of time and then the callback is called.
///
/// *** Note:
/// [useDeBouncerCallback] only be called within the build method of a widget.
/// ***
///
/// ///
/// use it:
/// ```
///  Button(
///   "Sakura",
///   onPressed: useDebouncerCallback((){
///     print('------------useDebouncerCallback');
///   }),
///  ),
/// ```
///

VoidCallback useDeBouncerCallback(
  VoidCallback onExecute, {
  int milliseconds = 300,
}) {
  return use(
    _DeBouncerCallback(
      milliseconds: milliseconds,
      onExecute: onExecute,
    ),
  );
}

class _DeBouncerCallback extends Hook<VoidCallback> {
  const _DeBouncerCallback({
    List<Object?>? keys,
    required this.milliseconds,
    required this.onExecute,
  }) : super(keys: keys);

  final int milliseconds;
  final VoidCallback onExecute;

  @override
  HookState<VoidCallback, _DeBouncerCallback> createState() =>
      _DeBouncerState();
}

class _DeBouncerState extends HookState<VoidCallback, _DeBouncerCallback> {
  Timer? _timer;

  @override
  VoidCallback build(BuildContext context) => debounce;

  void debounce() {
    if (_timer != null) {
      _timer!.cancel();
    }

    _timer = Timer(
      Duration(milliseconds: hook.milliseconds),
      hook.onExecute,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }
}
