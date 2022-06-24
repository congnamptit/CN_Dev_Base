import 'package:cn_base/features/open_app/login/view_model/signup_view_model.dart';
import 'package:cn_base/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../widgets/stfuls/animation_app.dart';
import '../../../widgets/stless/buttons/button_bottom.dart';
import '../../../widgets/stless/form/text_form_app.dart';
import '../../../widgets/stless/text/text_view_app.dart';

class SignUpPage extends HookConsumerWidget {
  const SignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    final router = ref.read(routerProvider);
    final vm = ref.read(signUpVMProvider);
    final vmTap = ref.watch(signUpVMProvider);
    final setState = ref.read(signUpVMProvider).updateState();

    var animationCtr = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );
    useAnimation(animationCtr);

    useEffect(
      () {
        animationCtr.addStatusListener(
          (status) {
            if (status == AnimationStatus.dismissed) {
              vmTap.tapSignup = false;
              setState;
            }
          },
        );
        return null;
      },
      [animationCtr],
    );

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/img/background_girl.png'),
              fit: BoxFit.cover,
            )),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(0, 0, 0, 0.2),
                    Color.fromRGBO(0, 0, 0, 0.3),
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                ),
              ),
              child: ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Column(
                        children: [
                          Container(
                            alignment: AlignmentDirectional.topCenter,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: mediaQueryData.padding.top + 40,
                                  ),
                                ),
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
                                        image:
                                            AssetImage('assets/img/Logo.png'),
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
                                const SizedBox(height: 140),
                                TextFromApp(
                                  icon: Icons.email,
                                  password: false,
                                  email: 'Email',
                                  inputType: TextInputType.emailAddress,
                                ),
                                const SizedBox(height: 10),
                                TextFromApp(
                                  icon: Icons.vpn_key,
                                  password: true,
                                  email: 'Password',
                                  inputType: TextInputType.text,
                                ),
                                TextButton(
                                  onPressed: () {
                                    router.replace(const LoginRoute());
                                  },
                                  child: const TextViewApp(
                                    title: 'Have Account? Sign In',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    letterSpacing: 0.2,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: mediaQueryData.padding.top + 175.0,
                                    bottom: 0.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      vmTap.tapSignup == false
                          ? InkWell(
                              splashColor: Colors.yellow,
                              onTap: () {
                                vmTap.tapSignup = true;
                                setState;
                                vm.playAnimation(animationCtr);
                              },
                              child: const ButtonBottom(
                                title: 'Signup',
                                colors: <Color>[
                                  Color(0xFF121940),
                                  Color(0xFF6E48AA)
                                ],
                                boxShadow: BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 15.0,
                                ),
                              ),
                            )
                          : AnimationApp(
                              color: const Color(0xFF3B2E6F),
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
        ],
      ),
    );
  }
}
