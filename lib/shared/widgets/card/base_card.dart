import 'package:flutter/material.dart';
import 'package:moli_app/constants/constants.dart';

import '../../shared.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({
    super.key,
    required this.content,
    this.leading,
    this.leadingGap = 24,
    this.trailing,
    this.trailingGap = 24,
    this.height,
    this.padding,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.selectalbe = false,
    this.isSelected = false,
    this.onSelected,
    this.onTap,
    this.decoration,
  });

  final VoidCallback? onTap;
  final Widget? leading;
  final double leadingGap;
  final List<Widget> content;
  final double trailingGap;
  final Widget? trailing;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final bool selectalbe;
  final bool isSelected;
  final ValueChanged<bool?>? onSelected;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: onTap,
      child: Stack(
        children: <Widget>[
          Container(
            height: height,
            padding: padding ?? const EdgeInsets.all(16),
            decoration: decoration ??
                BoxDecoration(
                  color: ColorPalettes.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        offset: const Offset(0, 2),
                        blurRadius: 9,
                        color:
                            ColorPalettes.neutralVariant50.withOpacity(0.12)),
                    BoxShadow(
                        offset: const Offset(0, 22),
                        blurRadius: 136,
                        color:
                            ColorPalettes.neutralVariant50.withOpacity(0.03)),
                  ],
                ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: crossAxisAlignment,
              children: <Widget>[
                if (leading != null) ...<Widget>[
                  leading!,
                  SizedBox(width: leadingGap),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: mainAxisAlignment,
                    children: content,
                  ),
                ),
                if (trailing != null) ...<Widget>[
                  SizedBox(width: trailingGap),
                  trailing!,
                ],
              ],
            ),
          ),
          if (selectalbe)
            Align(
                alignment: Alignment.topRight,
                child: AppCheckbox(onChanged: onSelected, value: isSelected)),
        ],
      ),
    );
  }
}
