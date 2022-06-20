library router;

import 'package:auto_route/auto_route.dart';
import 'package:cn_base/features/brand/show/brand_page.dart';
import 'package:cn_base/features/cart/show/cart_page.dart';
import 'package:cn_base/features/profile/show/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/home/show/home_page.dart';
import '../features/open_app/login/chose_login_or_signup.dart';
import '../features/open_app/onboarding/onboarding.dart';
import '../features/root/root_page.dart';
import '../features/splash/splash_page.dart';

part 'router.gr.dart';
part 'router_observer.dart';

final routerProvider = Provider<AppRouter>((_) => AppRouter());

@CupertinoAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: SplashPage,
      initial: true,
    ),
    AutoRoute(
      path: 'chose_login',
      page: ChoseLoginPage,
      initial: true,
    ),
    AutoRoute(
      path: 'onboard',
      page: OnBoardingPage,
      initial: true,
    ),
    AutoRoute(
      path: '/root',
      page: RootPage,
      children: <AutoRoute>[
        AutoRoute(
          path: 'home',
          page: HomePage,
        ),
        AutoRoute(
          path: 'band',
          page: BrandPage,
        ),
        AutoRoute(
          path: 'cart',
          page: CartPage,
        ),
        AutoRoute(
          path: 'profile',
          page: ProfilePage,
        ),
      ],
    ),
    // AutoRoute(
    //   path: '/product_details',
    //   page: ProductDetailsPage,
    // ),
    // AutoRoute(
    //   path: '/order_detail',
    //   page: OrderDetailPage,
    // ),
    // AutoRoute(
    //   path: '/admin_add_product',
    //   page: AdminAddProductPage,
    // ),
    // AutoRoute(
    //   path: '/admin_menu',
    //   page: AdminSettingMenuPage,
    // ),
    // AutoRoute(
    //   path: '/admin_product',
    //   page: AdminProductPage,
    // ),
    // AutoRoute(
    //   path: '/admin_supplier',
    //   page: AdminSupplierPage,
    // ),
    // AutoRoute(
    //   path: '/admin_product_update',
    //   page: AdminProductUpdatePage,
    // ),
    // AutoRoute(
    //   path: '/order_export_pdf',
    //   page: OrderPDFPage,
    // ),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter._();

  static AppRouter? _instance;

  factory AppRouter() => _instance ??= AppRouter._();
}
