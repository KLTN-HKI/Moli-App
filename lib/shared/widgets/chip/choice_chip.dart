import 'package:flutter/material.dart';
import 'package:moli_app/constants/constants.dart';
import '../../shared.dart';

class AppChoiceChip extends StatelessWidget {
  const AppChoiceChip({
    super.key,
    this.selected = false,
    required this.label,
    required this.onSelected,
    this.padding,
    this.avatar,
    this.avatarBorder = const RoundedRectangleBorder(),
    this.selectedColor,
    this.backgroundColor = Colors.transparent,
    this.side,
  });

  final bool selected;
  final Widget label;
  final ValueChanged<bool>? onSelected;

  final EdgeInsetsGeometry? padding;
  final Widget? avatar;
  final Color? selectedColor;
  final Color backgroundColor;
  final ShapeBorder avatarBorder;
  final BorderSide? side;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      padding: padding ?? const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: side ??
            BorderSide(
                color: selected
                    ? ColorPalettes.primary40
                    : ColorPalettes.neutralVariant10),
      ),
      elevation: selected ? 2 : 0,
      avatar: avatar,
      avatarBorder: avatarBorder,
      backgroundColor: backgroundColor,
      selectedColor: ColorPalettes.white,
      disabledColor: ColorPalettes.neutral90,
      shadowColor: ColorPalettes.primary10,
      selectedShadowColor: ColorPalettes.primary10,
      labelStyle: context.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w600,
          color: selected
              ? selectedColor ?? ColorPalettes.primary40
              : ColorPalettes.neutralVariant30),
      // required
      label: label,
      selected: selected,
      onSelected: onSelected,
    );
  }
}
