import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/constants.dart';
import '../../shared.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    this.child,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.padding,
    this.primary,
    this.expandedWith = true,
    this.isLoading = false,
    this.alignment,
    this.dense = true,
    this.height,
    this.borderRadius,
  });

  final Widget? child;

  final Color? primary;

  final EdgeInsetsGeometry? padding;

  final VoidCallback? onPressed;

  final VoidCallback? onLongPress;

  final ValueChanged<bool>? onHover;

  final ValueChanged<bool>? onFocusChange;

  final bool expandedWith;

  final AlignmentGeometry? alignment;

  final double? height;

  final bool isLoading;

  final bool dense;

  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: ColorPalettes.primary10,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8.r)),
        textStyle: context.textTheme.titleLarge?.weight500,
        backgroundColor: primary ?? ColorPalettes.primary40,
        foregroundColor: onPressed != null
            ? ColorPalettes.white
            : ColorPalettes.neutralVariant10,
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
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        child: isLoading
            ? SizedBox.square(
                dimension: 48.r,
                child: Lottie.asset(JsonAssets.loading),
              )
            : child,
      ),
    );
  }
}
