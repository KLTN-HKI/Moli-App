import 'package:flutter/material.dart';

import 'package:moli_shared/moli_shared.dart';

class BackgroundStack extends StatelessWidget {
  const BackgroundStack({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        SizedBox(
          width: context.width,
          height: context.height,
          child: Image.asset(
            ImageAssets.backgroundAuth,
            fit: BoxFit.cover,
          ),
        ),
        child,
      ],
    );
  }
}
