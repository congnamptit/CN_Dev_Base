import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'router/router.dart';
import 'theme/theme.dart';

class App extends HookConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.read(routerProvider);
    return MaterialApp.router(
      title: 'Base New',
      theme: kLightThemeData,
      darkTheme: kLightThemeData,
      debugShowCheckedModeBanner: false,
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: AutoRouterDelegate(
        appRouter,
        navigatorObservers: () => [ref.read(routerObserverProvider)],
      ),
    );
  }
}
