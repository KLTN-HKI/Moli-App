import 'package:flutter/material.dart';

import 'package:moli_shared/moli_shared.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.colorScheme.background,
        borderRadius: BorderRadius.circular(12),
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
