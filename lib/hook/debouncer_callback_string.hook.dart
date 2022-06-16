import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// [useDeBouncerCallbackString] is used to prevent repeated calls to a method.
/// It will waits for a certain period of time
/// and then the callback is called with [String] data.
///
/// *** Note:
/// [useDeBouncerCallbackString] only be called
/// within the build method of a widget.
/// ***
///
/// ///
/// use it:
/// ```
///  TextArea(
///   onChanged: useDebouncerCallbackString((value) {
///     print(value);
///   }),
///  ),
/// ```
///

ValueChanged<String> useDeBouncerCallbackString(
  ValueChanged<String> onExecute, {
  int milliseconds = 300,
}) {
  return use(
    _DeBouncerCallbackString(
      onExecute: onExecute,
      milliseconds: milliseconds,
    ),
  );
}

class _DeBouncerCallbackString extends Hook<ValueChanged<String>> {
  const _DeBouncerCallbackString({
    List<Object?>? keys,
    required this.onExecute,
    required this.milliseconds,
  }) : super(keys: keys);

  final ValueChanged<String> onExecute;
  final int milliseconds;

  @override
  HookState<ValueChanged<String>, _DeBouncerCallbackString> createState() =>
      _DeBouncerState();
}

class _DeBouncerState
    extends HookState<ValueChanged<String>, _DeBouncerCallbackString> {
  Timer? _timer;

  @override
  ValueChanged<String> build(BuildContext context) => debounce;

  void debounce(String data) {
    if (_timer != null) {
      _timer!.cancel();
    }

    _timer = Timer(
      Duration(milliseconds: hook.milliseconds),
      () => hook.onExecute(data),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }
}
