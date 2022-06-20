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

  // bool _isCheckUser = false;
  //
  // SharedPreferences? prefs;

  Future<void> onInit() async {
    useEffect(() {
      checkLogin();
      return;
    }, []);
  }

  // Future<void> saveNavigatorPage() async {
  //   SharedPreferences preferences;
  //   preferences = await SharedPreferences.getInstance();
  //
  //   if (preferences.getString('userName') != null) {
  //     _isCheckUser = false;
  //     updateState();
  //   } else {
  //     _isCheckUser = true;
  //     updateState();
  //   }
  // }

  Future<void> checkLogin() async {
    try {
      await Future.delayed(const Duration(seconds: 3), () {
        // if (_isCheckUser) {
          router.replace(const ChoseLoginRoute());
        // } else {
        //   router.replace(const OnBoardingRoute());
        // }
      });
    } catch (e) {
      handleExceptions(e);
      throw Exception('There is a fatal error');
    }
  }
}
