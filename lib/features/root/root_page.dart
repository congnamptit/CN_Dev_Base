import 'package:auto_route/auto_route.dart';
import 'package:cn_base/router/router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../widgets/stless/assets_gen/assets.gen.dart';

class RootPage extends HookConsumerWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        BrandRoute(),
        CartRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: tabsRouter.setActiveIndex,
          items: [
            _NavigationItem(
              label: 'home',
              iconSrc: Assets.images.icDietGray.path,
              activeIconSrc: Assets.images.icDiet.path,
            ),
            _NavigationItem(
              label: 'brand',
              iconSrc: Assets.images.icDietGray.path,
              activeIconSrc: Assets.images.icDiet.path,
            ),
            _NavigationItem(
              label: 'cart',
              iconSrc: Assets.images.icDietGray.path,
              activeIconSrc: Assets.images.icDiet.path,
            ),
            _NavigationItem(
              label: 'profile',
              iconSrc: Assets.images.icDietGray.path,
              activeIconSrc: Assets.images.icDiet.path,
            ),
          ],
        );
      },
    );
  }
}

class _NavigationItem extends BottomNavigationBarItem {
  _NavigationItem({
    required String label,
    Widget? icon,
    String? iconSrc,
    Widget? activeIcon,
    String? activeIconSrc,
  })  :
        super(
          label: label,
          icon: icon ??
              Image.asset(
                iconSrc!,
                // height: Responsive.isMobile ? 24 : 34,
                fit: BoxFit.fill,
              ),
          activeIcon: activeIcon ??
              Image.asset(
                activeIconSrc!,
                // height: Responsive.isMobile ? 24 : 34,
                fit: BoxFit.fill,
              ),
        );
}
