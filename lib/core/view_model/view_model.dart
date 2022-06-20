import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/exceptions/exceptions.dart';
import '../../router/router.dart';
import '../../widgets/stless/loading/loading_provider.dart';

abstract class ViewModel extends ChangeNotifier {
  ViewModel(Reader read) : _read = read;

  final Reader _read;

  LoadingProvider get loading => _read(loadingProvider);

  StackRouter get router => _read(routerProvider);

  BuildContext get context => _read(contextProvider);

  ExceptionHandler get _exception => _read(exceptionHandlerProvider);

  bool isDisposed = false;

  /// This is a method of [ChangeNotifier] class
  ///
  /// Discards any resources used by the object. After this is called, the
  /// object is not in a usable state and should be discarded (calls to
  /// [addListener] and [removeListener] will throw after the object is
  /// disposed).
  ///
  /// This method should only be called by the object's owner.
  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }

  /// [handleExceptions] is a method that helps you analyze
  /// and handle possible errors at [ViewModel].
  ///
  /// So Please call it in [catch] method.
  void handleExceptions(dynamic e) => _exception.handler(e);

  /// [updateState] the same as [notifyListeners] of [ChangeNotifier].
  ///
  /// But it won't call [notifyListeners] if [isDisposed] = true.
  /// So please call [updateState] instead of [notifyListeners].
  void updateState() {
    if (isDisposed) {
      assert(throw Exception('ViewModel Disposed'));
      return;
    }

    notifyListeners();
  }
}
