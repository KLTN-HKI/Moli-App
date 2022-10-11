import 'package:flutter/material.dart';

import '../../shared.dart';

class StatusTag extends StatelessWidget {
  const StatusTag(
    this.text,
    this.color, {
    super.key,
    this.style,
    this.expanded = false,
  });

  final String text;
  final TextStyle? style;
  final Color color;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 12,
          width: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ).paddingAll(4),
        const SizedBox(width: 4),
        Flexible(
          child: AppText.b1(
            text,
          ).copyWith(style: style),
        ),
      ],
    );
  }
}
