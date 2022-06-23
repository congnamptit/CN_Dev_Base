import 'package:auto_route/auto_route.dart';
import 'package:cn_base/router/router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
              icon: const Icon(
                Icons.home,
                color: Colors.black38,
              ),
              activeIcon: const Icon(
                Icons.home,
                color: Color(0xFF6991C7),
              ),
            ),
            _NavigationItem(
              label: 'brand',
              icon: const Icon(
                Icons.shop,
                color: Colors.black38,
              ),
              activeIcon: const Icon(
                Icons.shop,
                color: Color(0xFF6991C7),
              ),
            ),
            _NavigationItem(
              label: 'cart',
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black38,
              ),
              activeIcon: const Icon(
                Icons.shopping_cart,
                color: Color(0xFF6991C7),
              ),
            ),
            _NavigationItem(
              icon: const Icon(
                Icons.person,
                color: Colors.black38,
              ),
              activeIcon: const Icon(
                Icons.person,
                color: Color(0xFF6991C7),
              ),
              label: 'profile',
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
  }) : super(
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
