import 'package:flutter/material.dart';
import 'package:moli_app/constants/constants.dart';
import 'package:moli_app/shared/shared.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.colorScheme.background,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: <BoxShadow>[
          BoxShadow(
              blurRadius: 17, color: ColorPalettes.black.withOpacity(.03)),
          BoxShadow(blurRadius: 5, color: ColorPalettes.black.withOpacity(.04)),
          BoxShadow(blurRadius: 2, color: ColorPalettes.black.withOpacity(.04)),
          BoxShadow(
              blurRadius: 0.8, color: ColorPalettes.black.withOpacity(.06)),
        ],
      ),
      child: child,
    );
  }
}
