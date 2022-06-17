library router;

import 'package:auto_route/auto_route.dart';
import 'package:cn_base/features/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


part 'router.gr.dart';
part 'router_observer.dart';

final routerProvider = Provider<AppRouter>((_) => AppRouter());

@CupertinoAutoRouter(
    replaceInRouteName: 'Page,Router',
    routes: <AutoRoute>[
      AutoRoute(
        path: '/',
        page: SplashPage,
      ),
    ],)

class AppRouter extends _$AppRouter {
  AppRouter._();

  static AppRouter? _instance;

  factory AppRouter() => _instance ??= AppRouter._();
}
