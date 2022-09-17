import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:moli_app/features/authentication/presentation/check_user/page/check_phone_page.dart';
import 'package:moli_app/features/authentication/presentation/profile/page/profile_page.dart';
import 'package:moli_app/features/authentication/presentation/register/page/register_page.dart';
import 'package:moli_app/features/features.dart';
import 'package:moli_app/features/on_boarding/on_boarding_page.dart';
import 'package:moli_app/features/splash/splash_page.dart';

import '../../features/setting/setting_page.dart';
import 'auth_guard.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    // AutoRoute(
    //   page: SplashPage,
    //   path: SplashPage.routeName,
    //   initial: true,
    // ),
    AutoRoute(
      page: IntroductionPage,
      path: IntroductionPage.routeName,
    ),
    AutoRoute(
      page: DashboardPage,
      path: DashboardPage.routeName,
      initial: true,
      // guards: <Type>[AuthGuard],
      children: <AutoRoute<dynamic>>[
        AutoRoute(
          page: ProfilePage,
          path: ProfilePage.routeName,
        ),
        AutoRoute(
          page: SettingPage,
          path: SettingPage.routeName,
        ),
      ],
    ),
    AutoRoute(
      page: LoginPage,
      path: LoginPage.routeName,
    ),
    AutoRoute(
      page: CheckPhoneNumberPage,
      path: CheckPhoneNumberPage.routeName,
    ),
    AutoRoute(
      page: RegisterPage,
      path: RegisterPage.routeName,
    ),
  ],
)
class AppRouter extends _$AppRouter {
  // AppRouter({required super.authGuard});
  AppRouter();
}
