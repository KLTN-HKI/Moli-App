import 'package:flutter/material.dart';
import 'package:moli_app/constants/constants.dart';
import 'package:moli_app/shared/shared.dart';

class BackgroundStack extends StatelessWidget {
  const BackgroundStack({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        SizedBox(
          width: 1.sw,
          height: 1.sh,
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
