import 'package:flutter/material.dart';

import 'package:moli_shared/moli_shared.dart';

import '../../../domain/appointment.dart';
import '../appointment_detail/appointment_detail_page.dart';
import 'appointment_status.dart';

class AppointmentItem extends StatelessWidget {
  const AppointmentItem({
    required this.appointment,
    super.key,
  });

  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      content: <Widget>[
        AppointmentStatusTag(status: appointment.appointmentStatus!),
        AppText.t0('${appointment.doctor?.name}'),
        const SizedBox(height: 4),
        AppText.b2('${appointment.hospital?.hospitalAddress?.addressDetail}'),
        const SizedBox(height: 4),
        AppText.b2(
            '${DateTimeUtils.formatDateTimeDateOnly(appointment.appointmentBookingDate)} (${DateTimeUtils.fromTimeToStringType2(appointment.appointmentStartTime)} - ${DateTimeUtils.fromTimeToStringType2(appointment.appointmentEndTime)})'),
      ],
      trailing: const AppIcon(IconAssets.icArrowRight),
      onTap: () => context.goRouter.go(
        '${context.goRouter.location}/${AppointmentDetailPage.routePath}/${appointment.appointmentUuid}',
        extra: appointment,
      ),
    );
  }
}
