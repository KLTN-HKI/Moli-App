import 'package:flutter/material.dart';
import 'package:moli_app/constants/constants.dart';
import '../../shared.dart';

class BouncingBaseCard extends StatelessWidget {
  const BouncingBaseCard({
    super.key,
    this.onTap,
    required this.icon,
    required this.header,
    this.height,
    this.padding,
    this.backgroundColor,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.trailing,
    this.headerFlex = false,
    this.borderRadius,
    this.shadowBox,
    this.withShadow = false,
  });

  final void Function()? onTap;
  final Widget icon;
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

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: onTap != null ? 1 : .5,
      child: Bounceable(
        onTap: onTap,
        child: Container(
          height: headerFlex ? null : height ?? 76,
          padding: padding ??
              const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
          decoration: BoxDecoration(
            color: backgroundColor ?? ColorPalettes.white,
            borderRadius: borderRadius ?? BorderRadius.circular(12),
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
            children: <Widget>[
              icon,
              SizedBox(width: 24.w),
              Expanded(
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
    );
  }
}
