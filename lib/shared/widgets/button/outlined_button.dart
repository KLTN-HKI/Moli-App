import 'package:flutter/material.dart';
import 'package:moli_app/constants/constants.dart';
import '../../shared.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.padding,
    this.primary,
    this.expandedWith = true,
    this.alignment,
    this.isLoading = false,
    this.dense = true,
    this.height,
    this.borderRadius,
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

  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        shadowColor: ColorPalettes.primary10,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
        side: BorderSide(color: primary ?? ColorPalettes.neutralVariant50),
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8)),
        textStyle: context.textTheme.titleMedium?.weight500,
        foregroundColor: primary ?? context.colorScheme.primary,
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
      onPressed: isLoading ? () {} : onPressed,
      onLongPress: isLoading ? () {} : onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 100),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (Widget child, Animation<double> animation) =>
              ScaleTransition(scale: animation, child: child),
          switchInCurve: Curves.fastOutSlowIn,
          child: isLoading
              ? SizedBox.square(
                  dimension: 24,
                  child: CircularProgressIndicator(color: primary))
              : child,
        ),
      ),
    );
  }
}
