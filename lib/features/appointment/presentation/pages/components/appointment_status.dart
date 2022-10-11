import 'package:flutter/material.dart';
import 'package:moli_app/constants/constants.dart';
import 'package:moli_app/features/appointment/domain/appointment.dart';
import 'package:moli_app/shared/shared.dart';

class AppointmentStatusTag extends StatelessWidget {
  const AppointmentStatusTag({super.key, required this.status});

  final AppointmentStatus status;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case AppointmentStatus.pending:
        return StatusTag(context.l10n.pending, ColorPalettes.yellow);
      case AppointmentStatus.confirm:
        return StatusTag(context.l10n.confirm, ColorPalettes.primary40);
      case AppointmentStatus.cancel:
        return StatusTag(context.l10n.cancelled, ColorPalettes.error40);
      case AppointmentStatus.change:
        return const StatusTag('', ColorPalettes.yellow);
    }
  }
}
