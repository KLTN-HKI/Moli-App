import 'package:flutter/material.dart';
import 'package:moli_app/constants/constants.dart';
import '../../shared.dart';

class AppToggleButtons extends StatelessWidget {
  const AppToggleButtons({
    super.key,
    required this.children,
    required this.isSelected,
    required this.onPressed,
    this.padding,
    this.color,
    this.primary,
    this.expandedWith = true,
    this.alignment,
  });

  final List<Widget> children;
  final List<bool> isSelected;
  final Color? color;
  final Color? primary;
  final EdgeInsetsGeometry? padding;
  final void Function(int index)? onPressed;
  final bool expandedWith;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      color: color ?? ColorPalettes.neutralVariant30,
      selectedColor: primary ?? ColorPalettes.primary40,
      selectedBorderColor: primary ?? ColorPalettes.primary40,
      fillColor: primary?.withOpacity(0.1) ?? ColorPalettes.primary95,
      splashColor: primary?.withOpacity(0.2) ?? ColorPalettes.primary80,
      hoverColor: primary?.withOpacity(0.1) ?? ColorPalettes.primary95,
      borderRadius: BorderRadius.circular(8),
      borderColor: color ?? ColorPalettes.neutralVariant30,
      borderWidth: 1,
      textStyle: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w500, color: ColorPalettes.secondary10),
      // required
      isSelected: isSelected,
      onPressed: onPressed,
      children: children,
    );
  }
}
