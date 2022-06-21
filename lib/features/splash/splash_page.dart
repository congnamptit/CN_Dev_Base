import 'package:cn_base/features/splash/splash_view_model.dart';
import 'package:cn_base/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/const/constants.dart';
import '../../widgets/lazy_future_builder.dart';
import '../../widgets/stless/buttons/button.dart';
import '../../widgets/stless/text/text_view_app.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(splashCtrlProvider).onInit();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/man.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(0, 0, 0, 0.3),
                Color.fromRGBO(0, 0, 0, 0.4),
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Welcome To',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w200,
                      fontSize: 18,
                    ),
                  ),
                  const TextViewApp(
                    title: 'Shopping App',
                    fontSize: 35,
                    letterSpacing: 0.4,
                  ),
                  const SizedBox(height: kDefaultExThinPadding),
                  FutureBuilder(
                    future: ref.read(splashCtrlProvider).onInit(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return LazyFutureBuilder(
                          lazyFuture: () async {
                            await ref.read(splashCtrlProvider).onInit();
                          },
                          builder: (context, future, isFutureExecuting) {
                            if (isFutureExecuting == false) {
                              return Button(
                                "Thử lại",
                                buttonType: ButtonType.accent,
                                onPressed: future,
                              );
                            }
                            return Container();
                          },
                        );
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
