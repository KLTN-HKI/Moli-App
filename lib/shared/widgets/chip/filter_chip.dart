import 'package:flutter/material.dart';
import 'package:moli_app/constants/constants.dart';
import '../../shared.dart';

class AppFilterChip extends StatelessWidget {
  const AppFilterChip({
    super.key,
    this.selected = false,
    required this.label,
    required this.onSelected,
    this.padding,
    this.avatar,
    this.avatarBorder,
    this.showCheckmark = false,
    this.selectedColor,
    this.backgroundColor = Colors.transparent,
    this.side,
  });

  final bool selected;
  final Widget label;
  final ValueChanged<bool>? onSelected;

  final EdgeInsetsGeometry? padding;
  final Widget? avatar;
  final bool showCheckmark;
  final Color? selectedColor;
  final Color backgroundColor;
  final ShapeBorder? avatarBorder;
  final BorderSide? side;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      padding: padding ?? const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: side ??
            BorderSide(
                color: selected
                    ? selectedColor ?? ColorPalettes.primary40
                    : ColorPalettes.neutralVariant10),
      ),
      elevation: selected ? 2 : 0,
      showCheckmark: showCheckmark,
      avatar: avatar,
      avatarBorder:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      backgroundColor: backgroundColor,
      selectedColor: ColorPalettes.white,
      disabledColor: ColorPalettes.neutral90,
      shadowColor: ColorPalettes.primary10,
      selectedShadowColor: ColorPalettes.primary10,
      checkmarkColor: selectedColor ?? ColorPalettes.primary40,
      labelStyle: context.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w600,
          color: selected
              ? ColorPalettes.primary40
              : ColorPalettes.neutralVariant30),
      // required
      label: label,
      selected: selected,
      onSelected: onSelected,
    );
  }
}
