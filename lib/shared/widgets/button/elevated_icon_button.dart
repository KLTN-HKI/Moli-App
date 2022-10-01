import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:moli_app/constants/color_palattes.dart';
import 'package:moli_app/constants/json_assets.dart';
import 'package:moli_app/shared/shared.dart';

class AppElevatedButtonIcon extends StatelessWidget {
  const AppElevatedButtonIcon({
    super.key,
    required this.icon,
    required this.label,
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

  final Widget label;

  final String icon;

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
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        surfaceTintColor: ColorPalettes.primary10,
        shadowColor: ColorPalettes.primary10,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8)),
        textStyle: context.textTheme.titleMedium?.weight500,
        backgroundColor: primary ?? context.colorScheme.primary,
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
      icon: AnimatedSize(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        child: isLoading
            ? SizedBox.square(
                dimension: 48,
                child: Lottie.asset(JsonAssets.loading),
              )
            : SvgPicture.asset(
                icon,
                color: onPressed != null
                    ? ColorPalettes.white
                    : ColorPalettes.neutralVariant10,
              ),
      ),
      label: label,
    );
  }
}
