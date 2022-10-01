import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moli_app/constants/color_palattes.dart';
import 'package:moli_app/router/router.dart';

import '../../shared.dart';

class AppBarSliver extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSliver({
    super.key,
    this.title,
    this.canBack = false,
    this.onBackClicked,
    this.actions = const <Widget>[],
    this.transparentAppBar = false,
    this.titleText,
    this.leading,
    this.bottom,
    this.shape,
    this.pinned = true,
    this.floating = false,
    this.snap = false,
    this.stretch = false,
    this.expandedHeight,
    this.flexibleSpace,
  });

  final Widget? title;
  final Widget? leading;
  final String? titleText;
  final List<Widget> actions;
  final bool canBack;
  final Function()? onBackClicked;
  final bool transparentAppBar;
  final PreferredSizeWidget? bottom;
  final ShapeBorder? shape;
  final bool pinned;
  final bool floating;
  final bool snap;
  final bool stretch;

  final double? expandedHeight;
  final Widget? flexibleSpace;

  @override
  Widget build(BuildContext context) {
    final GoRouter router = context.goRouter;
    return SliverAppBar(
      elevation: 0,
      backgroundColor: transparentAppBar ? ColorPalettes.transparent : null,
      leadingWidth: (router.canPop() || canBack || leading != null) ? 56 : 0,
      leading: (router.canPop() || canBack)
          ? Padding(
              padding: EdgeInsets.symmetric(vertical: 8.w),
              child: CustomBackButton(
                color: ColorPalettes.black,
                onPressed: onBackClicked ??
                    () =>
                        router.canPop() ? router.pop() : router.go(Routes.home),
              ),
            )
          : leading ?? const SizedBox(),
      centerTitle: true,
      title: title ??
          AppText.t0(
            titleText ?? '',
            color: transparentAppBar ? null : ColorPalettes.white,
          ).weight600,
      toolbarHeight: 60,
      actions: actions,
      bottom: bottom,
      shape: shape,
      pinned: pinned,
      floating: floating,
      snap: snap,
      stretch: stretch,
      expandedHeight: expandedHeight,
      flexibleSpace: flexibleSpace,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      (expandedHeight ?? kToolbarHeight) + (bottom?.preferredSize.height ?? 0));
}
