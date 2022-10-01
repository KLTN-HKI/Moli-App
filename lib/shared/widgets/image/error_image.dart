import 'package:flutter/material.dart';
import 'package:moli_app/constants/color_palattes.dart';
import 'package:moli_app/constants/image_assets.dart';

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
          decoration: const BoxDecoration(
            color: ColorPalettes.neutral99,
          ),
          child: Image.asset(ImageAssets.appIcon, height: size),
        ),
      ),
    );
  }
}
