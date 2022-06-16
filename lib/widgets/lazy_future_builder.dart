import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// use it:
///
/// ```
/// LazyFutureBuilder(
///   future: () async {
///     await Future.delayed(const Duration(seconds: 2));
///   },
///   builder: (context, futureBuilder, isFutureBuilding) => Button(
///     onPressed: futureBuilder,
///     child: Text(
///       isFutureBuilding ? "Loading" : "Submit",
///     ),
///   ),
/// ),
/// ```

typedef FutureWidgetBuilder = Widget Function(
  BuildContext context,
  Future Function() future,
  bool isFutureExecuting,
);

class LazyFutureBuilder extends HookWidget {
  const LazyFutureBuilder({
    Key? key,
    required this.builder,
    required this.lazyFuture,
  }) : super(key: key);

  final Future Function() lazyFuture;
  final FutureWidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    final isFutureExecutingNotifier = useState<bool>(false);

    return ValueListenableBuilder<bool>(
        valueListenable: isFutureExecutingNotifier,
        builder: (context, isFutureExecuting, child) {
          return builder(
            context,
            () async {
              await _execute(isFutureExecutingNotifier);
            },
            isFutureExecuting,
          );
        });
  }

  Future _execute(ValueNotifier<bool> isFutureExecutingNotifier) async {
    if (isFutureExecutingNotifier.value) {
      return;
    }

    try {
      isFutureExecutingNotifier.value == true;
      await lazyFuture();
    } finally {
      isFutureExecutingNotifier.value = false;
    }
  }
}
