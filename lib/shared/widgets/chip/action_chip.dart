import 'package:flutter/material.dart';
import 'package:moli_app/constants/constants.dart';
import '../../shared.dart';

class AppActionChip extends StatelessWidget {
  const AppActionChip({
    super.key,
    required this.label,
    required this.onPressed,
    this.padding,
    this.avatar,
    this.selectedColor,
    this.backgroundColor,
    this.side,
  });

  final Widget label;
  final VoidCallback onPressed;

  final EdgeInsetsGeometry? padding;
  final Widget? avatar;
  final Color? selectedColor;
  final Color? backgroundColor;
  final BorderSide? side;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      padding: padding ?? const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: side ??
            BorderSide(color: selectedColor ?? ColorPalettes.neutralVariant10),
      ),
      elevation: 0,
      avatar: avatar,
      backgroundColor: backgroundColor ?? ColorPalettes.transparent,
      shadowColor: ColorPalettes.primary10,
      labelStyle: context.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w600,
          color: selectedColor ?? ColorPalettes.neutralVariant30),
      // required
      label: label,
      onPressed: onPressed,
    );
  }
}
