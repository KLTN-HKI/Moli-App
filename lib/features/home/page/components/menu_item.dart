import 'package:flutter/material.dart';

import 'package:moli_shared/moli_shared.dart';

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
      // borderRadius: BorderRadius.circular(12),
      child: Ink(
        decoration: BoxDecoration(
          color: context.colorScheme.background,
          border: Border(
              bottom: BorderSide(color: context.colorScheme.surfaceVariant)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
        child: Row(
          children: <Widget>[
            AppIcon(icon, size: 24),
            const SizedBox(width: 8),
            Expanded(
              child: AppText.b0(label),
            ),
            const SizedBox(width: 8),
            if (withArrow) const AppIcon(IconAssets.icArrowRight)
          ],
        ),
      ),
    );
  }
}
