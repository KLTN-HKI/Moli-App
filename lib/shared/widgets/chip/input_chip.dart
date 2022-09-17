import 'package:flutter/material.dart';
import 'package:moli_app/constants/constants.dart';

import '../../shared.dart';

class AppInputChip extends StatelessWidget {
  const AppInputChip({
    super.key,
    this.selected = false,
    required this.label,
    this.onPressed,
    this.onSelected,
    this.onDeleted,
    this.padding,
    this.avatar,
    this.deleteIcon,
    this.avatarBorder = const RoundedRectangleBorder(),
    this.showCheckmark = false,
    this.selectedColor,
    this.backgroundColor = Colors.transparent,
    this.side,
  });

  final bool selected;
  final Widget label;
  final ValueChanged<bool>? onSelected;
  final VoidCallback? onPressed;
  final VoidCallback? onDeleted;

  final EdgeInsetsGeometry? padding;
  final Widget? avatar;
  final Widget? deleteIcon;
  final bool showCheckmark;
  final Color? selectedColor;
  final Color backgroundColor;
  final ShapeBorder avatarBorder;
  final BorderSide? side;

  @override
  Widget build(BuildContext context) {
    return InputChip(
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
      showCheckmark: showCheckmark,
      avatar: avatar,
      avatarBorder: avatarBorder,
      backgroundColor: backgroundColor,
      selectedColor: ColorPalettes.white,
      disabledColor: ColorPalettes.neutral90,
      shadowColor: ColorPalettes.primary10,
      selectedShadowColor: ColorPalettes.primary10,
      checkmarkColor: selectedColor ?? ColorPalettes.primary40,
      labelStyle: context.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w600,
          color: selected
              ? selectedColor ?? ColorPalettes.primary40
              : ColorPalettes.neutralVariant30),
      deleteIcon: deleteIcon ??
          AppIcon(IconAssets.icCloseCircle,
              color: selected
                  ? selectedColor ?? ColorPalettes.primary40
                  : ColorPalettes.neutral10),
      // required
      label: label,
      selected: selected,
      onSelected: onSelected,
      onPressed: onPressed,
      onDeleted: onDeleted,
    );
  }
}
