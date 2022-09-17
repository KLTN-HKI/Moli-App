import 'package:flutter/material.dart';
import 'package:moli_app/constants/constants.dart';

class AppCheckbox extends StatelessWidget {
  const AppCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.shape,
    this.side,
  });

  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final OutlinedBorder? shape;
  final BorderSide? side;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      focusColor: ColorPalettes.primary40,
      activeColor: ColorPalettes.primary40,
      checkColor: ColorPalettes.white,
      shape: shape ??
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      value: value,
      side: side ??
          const BorderSide(color: ColorPalettes.neutralVariant50, width: 2),
      onChanged: onChanged,
    );
  }
}
