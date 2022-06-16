part of utils;

/// [DeBouncer] được sử dụng để ngăn các cuộc gọi lặp lại đến một phương thức.
/// Nó sẽ đợi trong một khoảng thời gian nhất định và sau đó lệnh gọi lại được gọi.
///
/// use it:
/// ```
///   final _debouncer = Debouncer();
///
///  _debouncer.run(() {
///    print('------------Execute func');
///  });
///
///   @override
///   void dispose() {
///     _debouncer.dispose();
///     super.dispose();
///   }
///
class DeBouncer {
  Timer? _timer;

  void run(
    VoidCallback onExecute, {
    int milliseconds = 300,
  }) {
    if (_timer != null) {
      _timer!.cancel();
    }

    _timer = Timer(Duration(milliseconds: milliseconds), onExecute);
  }

  void dispose() => _timer?.cancel();
}
