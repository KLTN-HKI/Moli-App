import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_app/app/bloc/bloc.dart';
import 'package:moli_app/app/router/router.dart';
import 'package:moli_app/constants/constants.dart';
import 'package:moli_app/features/appointment/presentation/pages/appointment_page.dart';
import 'package:moli_app/features/authentication/presentation/profile/page/profile_page.dart';
import 'package:moli_app/features/home/home_page.dart';
import 'package:moli_app/features/notification/presentation/pages/notification_page.dart';
import 'package:moli_app/shared/shared.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  static const String routeName = '/';

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedTab = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void didUpdateWidget(covariant DashboardPage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listener: (BuildContext context, AppState state) {
        // state.maybeMap(
        //   unauthenticated: (_) {
        //     AutoRouter.of(context).replace(const LoginRoute());
        //   },
        //   orElse: () => null,
        // );
        state.maybeWhen(
          orElse: () {},
          firstTimeLogin: () => AutoRouter.of(context)
              .replaceAll(<PageRouteInfo<dynamic>>[const IntroductionRoute()]),
          unauthenticated: () => AutoRouter.of(context)
              .replaceAll(<PageRouteInfo<dynamic>>[const LoginRoute()]),
          authenticated: () => AutoRouter.of(context)
              .replaceAll(<PageRouteInfo<dynamic>>[const DashboardRoute()]),
        );
      },
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: PageView(
          physics: const ClampingScrollPhysics(),
          controller: _pageController,
          onPageChanged: (int value) => setState(() {
            _selectedTab = value;
          }),
          children: const <Widget>[
            HomePage(),
            AppointmentPage(),
            NotificationPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: context.textTheme.labelMedium
              ?.copyWith(color: context.colorScheme.primary)
              .weight500,
          unselectedLabelStyle: context.textTheme.labelMedium
              ?.copyWith(color: context.colorScheme.surface),
          selectedItemColor: context.colorScheme.primary,
          unselectedItemColor: context.colorScheme.onSurface,
          elevation: 0,
          currentIndex: _selectedTab,
          onTap: (int index) => _animateToTab(index),
          items: bottomIcons(
            context,
            context.colorScheme.onSurfaceVariant,
            context.colorScheme.primary,
          ),
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> bottomIcons(
    BuildContext context,
    Color defaultColor,
    Color activeColor,
  ) =>
      <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: AppIcon(IconAssets.icHome, color: defaultColor),
          activeIcon: AppIcon(IconAssets.icHomeBold, color: activeColor),
          label: context.l10n.home,
        ),
        BottomNavigationBarItem(
          icon: AppIcon(IconAssets.icCalendar, color: defaultColor),
          activeIcon: AppIcon(IconAssets.icCalendarBold, color: activeColor),
          label: context.l10n.appointment,
        ),
        BottomNavigationBarItem(
          icon: AppIcon(IconAssets.icNotify, color: defaultColor),
          activeIcon: AppIcon(IconAssets.icNotifyBold, color: activeColor),
          label: context.l10n.notification,
        ),
        BottomNavigationBarItem(
          icon: AppIcon(IconAssets.icProfile, color: defaultColor),
          activeIcon: AppIcon(IconAssets.icProfileBold, color: activeColor),
          label: context.l10n.profile,
        ),
      ];
  List<BoxShadow> drawerShadow(BuildContext theme) => <BoxShadow>[
        BoxShadow(
          offset: const Offset(0, 1),
          blurRadius: 10,
          color: ColorPalettes.primary10.withOpacity(.09),
        ),
        BoxShadow(
          offset: const Offset(0, 10),
          blurRadius: 60,
          color: ColorPalettes.primary10.withOpacity(.09),
        ),
      ];

  void _animateToTab(int index) {
    // _selectedTab = index;
    _pageController.jumpToPage(index);
    // if (index == 1 && index == _selectedTab) {}
  }
}
