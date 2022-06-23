import 'package:cn_base/features/open_app/login/view_model/login_view_model.dart';
import 'package:cn_base/router/router.dart';
import 'package:cn_base/widgets/stless/text/text_view_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../theme/theme.dart';
import '../../../widgets/stfuls/animation_app.dart';
import '../../../widgets/stless/buttons/button_bottom.dart';
import '../../../widgets/stless/buttons/button_custom.dart';
import '../../../widgets/stless/form/text_form_app.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    final router = ref.read(routerProvider);
    final vm = ref.read(loginVMProvider);
    var vmTap = ref.watch(loginVMProvider);
    final setState = ref.read(loginVMProvider).updateState();

    var animationCtr = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );
    useAnimation(animationCtr);

    useEffect(
      () {
        animationCtr.addStatusListener(
          (status) {
            if (status == AnimationStatus.dismissed) {
              vmTap.tap = false;
              setState;
            }
          },
        );
        return null;
      },
      [animationCtr],
    );

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/img/login_screen_background.png'),
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromRGBO(0, 0, 0, 0.0),
              Color.fromRGBO(0, 0, 0, 0.3)
            ],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
          )),
          child: ListView(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Column(
                    children: [
                      SizedBox(height: mediaQueryData.padding.top + 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Expanded(
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 2,
                            child: Image(
                              height: 70,
                              image: AssetImage('assets/img/Logo.png'),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: TextViewApp(
                              title: 'Shopping App',
                              fontSize: 20,
                            ),
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 60),
                      const ButtonCustom(
                        color: Color.fromRGBO(107, 112, 248, 1.0),
                        colorTxt: AppColors.white,
                        imagePath: "assets/img/icon_facebook.png",
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 15.0,
                          ),
                        ],
                        titleButton: 'Login Facebook',
                      ),
                      const SizedBox(height: 15),
                      const ButtonCustom(
                        color: AppColors.white,
                        colorTxt: Colors.black26,
                        imagePath: "assets/img/google.png",
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 10.0),
                        ],
                        titleButton: 'Login Google',
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: TextViewApp(title: 'OR'),
                      ),

                      /// TextFromField Email
                      TextFromApp(
                        icon: Icons.email,
                        password: false,
                        email: 'Email',
                        inputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 10),

                      /// TextFromField Password
                      TextFromApp(
                        icon: Icons.vpn_key,
                        password: true,
                        email: 'Password',
                        inputType: TextInputType.text,
                      ),
                      const SizedBox(height: 15),
                      TextButton(
                        onPressed: () {
                          router.replace(const SignUpRoute());
                        },
                        child: const TextViewApp(
                          title: 'Have Account? Sign In',
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: mediaQueryData.padding.top + 100.0,
                          bottom: 0.0,
                        ),
                      )
                    ],
                  ),
                  vmTap.tap == false
                      ? InkWell(
                          splashColor: Colors.yellow,
                          onTap: () {
                            vmTap.tap = true;
                            setState;
                            AnimationApp(
                              animationController: animationCtr,
                              onCompleted: () {
                                vm.router.replace(const RootRoute());
                              },
                            );
                            vm.playAnimation(animationCtr);
                          },
                          child: const ButtonBottom(
                            title: 'Login',
                            colors: <Color>[
                              Color(0xFF121940),
                              Color(0xFF6E48AA),
                            ],
                            boxShadow: BoxShadow(
                              color: Colors.black38,
                              blurRadius: 15.0,
                            ),
                          ),
                        )
                      : AnimationApp(
                          animationController: animationCtr,
                          onCompleted: () {
                            vm.router.replace(const RootRoute());
                          },
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
