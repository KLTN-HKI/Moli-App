import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moli_app/constants/constants.dart';
import 'package:moli_app/router/router.dart';
import 'package:moli_app/shared/shared.dart';

class DashBoard extends StatelessWidget {
  /// Constructs an [DashBoard].
  const DashBoard({
    required this.location,
    required this.child,
    super.key,
  });

  /// The widget to display in the body of the Scaffold.
  /// In this sample, it is a Navigator.
  final Widget child;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(top: false, left: false, right: false, child: child),
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
        items: bottomIcons(
          context,
          context.colorScheme.onSurfaceVariant,
          context.colorScheme.primary,
        ),
        currentIndex: _routeToIndex(location),
        onTap: (int idx) => context.go(_indexToRoute(idx)),
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

  static int _routeToIndex(String location) {
    if (location.contains(Routes.home)) {
      return 0;
    } else if (location.contains(Routes.appointment)) {
      return 1;
    } else if (location.contains(Routes.notification)) {
      return 2;
    } else if (location.contains(Routes.menu)) {
      return 3;
    }
    return 0;
  }

  static String _indexToRoute(int index) {
    switch (index) {
      case 0:
        return Routes.home;
      case 1:
        return Routes.appointment;
      case 2:
        return Routes.notification;
      case 3:
        return Routes.menu;
      default:
        return Routes.home;
    }
  }
}
