import 'package:flutter/material.dart';
import 'package:moli_app/constants/image_assets.dart';

import '../../shared/shared.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    this.title,
    this.content,
  });

  final String? title;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(ImageAssets.notFound).paddingSymmetric(horizontal: 48),
        const SizedBox(height: 64),
        AppText.t0(title ?? context.l10n.empty_title),
        const SizedBox(height: 4),
        AppText.h2(content ?? ''),
      ],
    );
  }
}
