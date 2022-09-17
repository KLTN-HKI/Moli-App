import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:moli_app/constants/constants.dart';
import '../../shared.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.onPressed,
    this.color,
  });

  final void Function()? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: IconButton(
        icon: AppIcon(
          IconAssets.icArrowLeft,
          size: 24,
          color: color ?? ColorPalettes.white,
        ),
        onPressed: onPressed ?? () => AutoRouter.of(context).pop(),
      ),
    );
  }
}
