import 'package:flutter/material.dart';
import 'package:moli_app/shared/shared.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    this.message,
    this.child,
    this.crossAxisAlignment,
    this.textAlign = TextAlign.left,
    this.padding = EdgeInsets.zero,
  });

  final String? message;
  final Widget? child;
  final EdgeInsets padding;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          children: <Widget>[
            if (child != null) ...<Widget>[
              Center(child: child),
              const SizedBox(
                height: 12,
              )
            ],
            Text(
              message!,
              style: context.textTheme.titleMedium,
              textAlign: textAlign,
            ),
          ],
        ),
      ),
    );
  }
}
