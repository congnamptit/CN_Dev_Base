import 'package:cn_base/features/home/show/search_page.dart';
import 'package:cn_base/router/router.dart';
import 'package:cn_base/widgets/stless/text/text_view_app.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppBarCustom extends HookConsumerWidget {
  const AppBarCustom({
    Key? key,
  }) : super(key: key);

  final String countNotice = '5';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MediaQueryData media = MediaQuery.of(context);
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    // final updateState = ref.read(homeVMProvider).updateState();
    final router = ref.read(routerProvider);

    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      height: 58 + statusBarHeight,
      decoration: const BoxDecoration(
        /// gradient in appbar
        gradient: LinearGradient(
          colors: [
            Color(0xFFA3BDED),
            Color(0xFF6991C7),
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
                  // CustomRoute(
                  //   page: SearchPage,
                  //   durationInMilliseconds: 750,
                  //   transitionsBuilder:
                  //       (_, Animation<double> animation, __, Widget child) {
                  //     return Opacity(
                  //       opacity: animation.value,
                  //       child: child,
                  //     );
                  //   },
                  // );

              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const SearchPage(),
                  transitionDuration: const Duration(milliseconds: 750),
                  transitionsBuilder:
                      (_, Animation<double> animation, __, Widget child) {
                    return Opacity(
                      opacity: animation.value,
                      child: child,
                    );
                  },
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(left: media.padding.left + 15),
              height: 37.0,
              width: 222.0,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                shape: BoxShape.rectangle,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 16),
                  Image.asset(
                    'assets/img/search2.png',
                    height: 22,
                  ),
                  const SizedBox(width: 16),
                  const TextViewApp(
                    title: 'Shopping App',
                    color: Colors.black12,
                    fontSize: 16,
                    letterSpacing: 0,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              router.push(const RootRoute());
            },
            child: Image.asset(
              'assets/img/chat.png',
              height: media.devicePixelRatio + 20,
            ),
          ),
          InkWell(
            onTap: () {
              router.push(const RootRoute());
            },
            child: Stack(
              alignment: const AlignmentDirectional(-2, -2),
              children: [
                Image.asset(
                  'assets/img/notifications_button.png',
                  height: 24,
                ),
                CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.redAccent,
                  child: Text(
                    countNotice,
                    style: const TextStyle(
                      fontSize: 10.0,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
