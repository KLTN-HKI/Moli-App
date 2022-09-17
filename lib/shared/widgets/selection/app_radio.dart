import 'package:flutter/material.dart';
import 'package:moli_app/constants/constants.dart';

class AppRadio<T> extends StatelessWidget {
  const AppRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Radio<T>(
      focusColor: ColorPalettes.primary40,
      activeColor: ColorPalettes.primary40,
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}
