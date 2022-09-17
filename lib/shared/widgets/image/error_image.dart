import 'package:flutter/material.dart';
import 'package:moli_app/constants/constants.dart';
import 'package:moli_app/shared/shared.dart';

class ErrorImage extends StatelessWidget {
  const ErrorImage({super.key, this.size, this.isRounded = false});

  final double? size;
  final bool isRounded;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(isRounded ? 50 : 0),
        child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            color: ColorPalettes.neutral99,
          ),
          child: const AppIcon(IconAssets.appIcon),
        ),
      ),
    );
  }
}
