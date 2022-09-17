import 'package:flutter/material.dart';
import 'package:moli_app/constants/constants.dart';

import '../../shared.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.padding,
    this.primary,
    this.expandedWith = false,
    this.alignment,
    this.isLoading = false,
    this.dense = true,
    this.height,
  });

  final Widget child;

  final Color? primary;

  final EdgeInsetsGeometry? padding;

  final VoidCallback? onPressed;

  final VoidCallback? onLongPress;

  final ValueChanged<bool>? onHover;

  final ValueChanged<bool>? onFocusChange;

  final bool expandedWith;

  final AlignmentGeometry? alignment;

  final bool isLoading;

  final bool dense;

  final double? height;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shadowColor: ColorPalettes.primary10,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: onPressed != null
                ? ColorPalettes.primary10
                : ColorPalettes.neutralVariant10),
        primary: primary ?? ColorPalettes.primary40,
        minimumSize: Size(
          expandedWith ? double.infinity : 0,
          height != null
              ? height!
              : dense
                  ? 48
                  : 64,
        ),
        alignment: alignment,
      ),
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        switchOutCurve: Curves.fastOutSlowIn,
        transitionBuilder: (Widget child, Animation<double> animation) =>
            ScaleTransition(scale: animation, child: child),
        child: isLoading
            ? const SizedBox.square(
                dimension: 32,
                child: CircularProgressIndicator(),
              )
            : child,
      ),
    );
  }
}
