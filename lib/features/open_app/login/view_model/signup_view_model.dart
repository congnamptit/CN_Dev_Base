import 'package:cn_base/router/router.dart';
import 'package:flutter/animation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/view_model/view_model.dart';

final signUpVMProvider = Provider.autoDispose<SignUpViewModel>(
  (ref) => SignUpViewModel(ref.read),
);

class SignUpViewModel extends ViewModel {
  SignUpViewModel(Reader read) : super(read);

  late bool tap = false;
  late bool tapSignup = false;

  Future<void> playAnimation(AnimationController animationController) async {
    try {
      await animationController.forward();
      await animationController.reverse();
    } on TickerCanceled {}
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
