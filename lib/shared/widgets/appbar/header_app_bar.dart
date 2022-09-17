import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moli_app/constants/constants.dart';
import 'package:moli_app/shared/shared.dart';

import '../widgets.dart';

class HeaderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HeaderAppBar({
    super.key,
    this.canBack = true,
    this.title,
    this.onBackClicked,
    this.actions = const <Widget>[],
    this.transparentAppBar = false,
  });
  final Widget? title;
  final List<Widget> actions;
  final bool canBack;
  final Function()? onBackClicked;
  final bool transparentAppBar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      // default 40 + padding 16
      backgroundColor: transparentAppBar ? ColorPalettes.transparent : null,
      leadingWidth: canBack ? 56.w : 0,
      leading: canBack
          ? Container(
              margin: EdgeInsets.only(left: 16.w),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.w),
                child: CustomBackButton(
                  color: transparentAppBar
                      ? ColorPalettes.white
                      : ColorPalettes.black,
                  onPressed: onBackClicked,
                ),
              ))
          : Container(),
      titleTextStyle: context.textTheme.titleLarge?.weight500,
      centerTitle: true,
      title: title,
      toolbarHeight: 56.w,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.w);
}
