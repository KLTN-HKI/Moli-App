import 'package:flutter/material.dart';
import 'package:moli_app/constants/constants.dart';

import '../../shared.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({
    super.key,
    required this.header,
    this.onTap,
    this.leading,
    this.height,
    this.padding,
    this.backgroundColor,
    this.trailing,
    this.borderRadius,
    this.shadowBox,
    this.leadingGap,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.headerFlex = false,
    this.withShadow = false,
    this.isSelected = false,
    this.selectalbe = false,
  });

  final void Function()? onTap;
  final Widget? leading;
  final double? leadingGap;
  final List<Widget> header;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final MainAxisAlignment mainAxisAlignment;
  final Widget? trailing;
  final bool headerFlex;
  final bool withShadow;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? shadowBox;
  final bool isSelected;
  final bool selectalbe;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        InkWell(
          onTap: onTap,
          child: Container(
            height: headerFlex ? null : height ?? 76,
            padding: padding ??
                const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
            decoration: BoxDecoration(
              color: backgroundColor ?? context.colorScheme.background,
              borderRadius: borderRadius ?? BorderRadius.circular(12),
              // border: isSelected ? Border.all(color: ColorPalattes.primary40) : null,
              boxShadow: withShadow
                  ? shadowBox ??
                      <BoxShadow>[
                        BoxShadow(
                            offset: const Offset(0, 2),
                            blurRadius: 8,
                            color: ColorPalettes.neutral10.withOpacity(.15)),
                      ]
                  : null,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (leading != null) ...<Widget>[
                  leading!,
                  if (leadingGap != null)
                    SizedBox(width: leadingGap)
                  else
                    SizedBox(width: 24.w),
                ],
                Flexible(
                  fit: FlexFit.tight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: mainAxisAlignment,
                    children: header,
                  ),
                ),
                if (trailing != null) trailing!
              ],
            ),
          ),
        ),
      ],
    );
  }
}
