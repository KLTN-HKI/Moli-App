import 'package:flutter/material.dart';
import 'package:moli_app/constants/constants.dart';
import 'package:moli_app/shared/shared.dart';

class AppMenuItem extends StatelessWidget {
  const AppMenuItem({
    super.key,
    required this.icon,
    required this.label,
    this.onPressed,
    this.withArrow = true,
  });

  final String icon, label;
  final Function()? onPressed;
  final bool withArrow;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      // borderRadius: BorderRadius.circular(12.r),
      child: Ink(
        decoration: BoxDecoration(
          color: context.colorScheme.background,
          border: Border(
              bottom: BorderSide(color: context.colorScheme.surfaceVariant)),
        ),
        padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 4.w),
        child: Row(
          children: <Widget>[
            AppIcon(icon, size: 24.w),
            SizedBox(width: 8.w),
            Expanded(
              child: AppText.b0(label),
            ),
            SizedBox(width: 8.w),
            if (withArrow) const AppIcon(IconAssets.icArrowRight)
          ],
        ),
      ),
    );
  }
}
