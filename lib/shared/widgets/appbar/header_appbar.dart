import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:moli_app/constants/constants.dart';
import 'package:moli_app/router/router.dart';
import 'package:moli_app/shared/shared.dart';

class HeaderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HeaderAppBar({
    super.key,
    this.routeBack,
    this.onBackClicked,
    this.title,
    this.actions = const <Widget>[],
    this.transparentAppBar = false,
    this.centerTitle = true,
    this.titleText,
    this.bottom,
    this.shape,
  });
  final String? routeBack;
  final Function()? onBackClicked;
  final Widget? title;
  final String? titleText;
  final List<Widget> actions;
  final bool transparentAppBar;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    final GoRouter router = context.goRouter;
    return AppBar(
      systemOverlayStyle: context.isDarkMode
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      elevation: 0,
      // default 40 + padding 16
      backgroundColor: transparentAppBar ? ColorPalettes.transparent : null,
      leadingWidth: router.canPop() || routeBack != null ? 56 : 0,
      leading: (router.canPop() || routeBack != null)
          ? Container(
              margin: EdgeInsets.only(left: 16.w),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.w),
                child: CustomBackButton(
                  color: transparentAppBar
                      ? ColorPalettes.primary10
                      : ColorPalettes.white,
                  onPressed: onBackClicked ??
                      () => router.canPop()
                          ? router.pop()
                          : router.go(routeBack ?? Routes.home),
                ),
              ))
          : const SizedBox(),
      centerTitle: centerTitle,
      title: title ??
          AppText.t0(
            titleText ?? '',
            color: transparentAppBar
                ? ColorPalettes.primary10
                : ColorPalettes.white,
          ).weight600,
      toolbarHeight: 80,
      actions: actions,
      bottom: bottom,
      shape: shape,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}
