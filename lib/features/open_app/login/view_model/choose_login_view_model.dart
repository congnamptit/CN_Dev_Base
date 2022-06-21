import 'package:cn_base/router/router.dart';
import 'package:flutter/animation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/view_model/view_model.dart';

final chooseLoginVMProvider = Provider.autoDispose<ChoseLoginVM>(
      (ref) => ChoseLoginVM(ref.read),
);

class ChoseLoginVM extends ViewModel {
  ChoseLoginVM(Reader read): super(read);


  Future<void> playAnimation(AnimationController animationController) async {
    try {
      await animationController.forward();
      await animationController.reverse();
    } on TickerCanceled {}
  }

  Future<void> checkLogin() async {
    try {
      await Future.delayed(const Duration(seconds: 3), () {
        // if (_isCheckUser) {
        router.replace(ChooseLoginRoute());
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
