
import 'package:cn_base/router/router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/view_model/view_model.dart';

final splashCtrlProvider = Provider.autoDispose<SplashViewModel>(
  (ref) => SplashViewModel(ref.read),
);

class SplashViewModel extends ViewModel {
  SplashViewModel(Reader read)
      : _read = read,
        super(read);

  final Reader _read;

  Future<void> onInit() async {
    useEffect(() {
      checkLogin();
      return;
    }, []);
  }

  Future<void> checkLogin() async {
    try {
      await Future.delayed(const Duration(seconds: 3), () {
        router.replace(const ChooseLoginRoute());
      });
    } catch (e) {
      handleExceptions(e);
      throw Exception('There is a fatal error');
    }
  }
}
