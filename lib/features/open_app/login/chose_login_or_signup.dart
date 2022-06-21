import 'package:cn_base/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../widgets/stfuls/animation_app.dart';
import '../../../widgets/stfuls/carousel_pro/src/carousel_pro.dart';
import '../../../widgets/stless/buttons/button_login.dart';
import '../../../widgets/stless/text/text_view_app.dart';
import 'view_model/choose_login_view_model.dart';

@immutable
class ChooseLoginPage extends HookConsumerWidget {
  ChooseLoginPage({Key? key}) : super(key: key);

  var tapLogin = 0;
  var tapSignup = 0;
  late Animation animation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    final vm = ref.read(chooseLoginVMProvider);
    final setState = ref.read(chooseLoginVMProvider).updateState();

    var animationCtr = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );
    useAnimation(animationCtr);

    useEffect(
      () {
        animationCtr.addStatusListener(
          (status) {
            if (status == AnimationStatus.dismissed) {
              tapLogin = 0;
              tapSignup = 0;
              setState;
            }
          },
        );
        return null;
      },
      [animationCtr],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: const Carousel(
              boxFit: BoxFit.cover,
              autoplay: true,
              animationDuration: Duration(milliseconds: 300),
              dotSize: 0.0,
              dotSpacing: 16.0,
              dotBgColor: Colors.transparent,
              showIndicator: false,
              overlayShadow: false,
              images: [
                AssetImage('assets/img/girl.png'),
                AssetImage("assets/img/slider_login2.png"),
                AssetImage('assets/img/slider_login3.png'),
                AssetImage('assets/img/slider_login4.png'),
              ],
            ),
          ),
          Container(
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
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        SizedBox(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: mediaQuery.padding.top + 50.0,
                                ),
                              ),
                              const Center(
                                /// Animation text treva shop accept from splashscreen layout (Click to open code)
                                child: TextViewApp(
                                  title: 'Shopping App',
                                  fontSize: 20,
                                ),
                              ),

                              /// Padding Text "Get best product in treva shop" (Click to open code)
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 160.0,
                                  right: 160.0,
                                  top: mediaQuery.padding.top + 190.0,
                                  bottom: 10.0,
                                ),
                                child: Container(
                                  color: Colors.white,
                                  height: 0.5,
                                ),
                              ),

                              /// to set Text "get best product...." (Click to open code)
                              const TextViewApp(
                                title: 'Get best product in Shopping App',
                                fontSize: 16,
                                fontWeight: FontWeight.w200,
                                letterSpacing: 1.3,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 250.0),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            /// To create animation if user tap == animation play (Click to open code)
                            tapLogin == 0
                                ? Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      splashColor: Colors.white,
                                      onTap: () {
                                        tapLogin = 1;
                                        setState;
                                        vm.playAnimation(animationCtr);
                                      },
                                      child: const ButtonLogin(txt: 'Signup'),
                                    ),
                                  )
                                : AnimationApp(
                                    animationController: animationCtr,
                                    onCompleted: () {
                                      vm.router.replace(const SignUpRoute());
                                    },
                                  ),
                            const Padding(padding: EdgeInsets.only(top: 15.0)),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  /// To set white line (Click to open code)
                                  Container(
                                    color: Colors.white,
                                    height: 0.2,
                                    width: 80.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10.0,
                                      right: 10.0,
                                    ),

                                    /// navigation to home screen if user click "OR SKIP" (Click to open code)
                                    child: InkWell(
                                      onTap: () {
                                        vm.router.replace(const RootRoute());
                                      },
                                      child: const TextViewApp(
                                        title: 'OR SKIP',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                  ),

                                  /// To set white line (Click to open code)
                                  Container(
                                    color: Colors.white,
                                    height: 0.2,
                                    width: 80.0,
                                  )
                                ],
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(top: 70.0)),
                          ],
                        ),
                        tapSignup == 0
                            ? Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: Colors.white,
                                  onTap: () {
                                    tapSignup = 1;
                                    setState;
                                    vm.playAnimation(animationCtr);
                                  },
                                  child: const ButtonLogin(txt: 'Login'),
                                ),
                              )
                            : AnimationApp(
                                animationController: animationCtr,
                                onCompleted: () {
                                  vm.router.replace(const LoginRoute());
                                },
                              ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
