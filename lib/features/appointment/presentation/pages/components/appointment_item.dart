import 'package:flutter/material.dart';
import 'package:moli_app/constants/constants.dart';
import 'package:moli_app/shared/shared.dart';

import '../../../domain/appointment.dart';
import '../appointment_detail/appointment_detail.dart';
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
      padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 16.w),
      content: <Widget>[
        AppointmentStatusTag(status: appointment.appointmentStatus!),
        AppText.t0('${appointment.doctor?.name}'),
        SizedBox(height: 4.w),
        AppText.b2('${appointment.hospital?.hospitalAddress?.addressDetail}'),
        SizedBox(height: 4.w),
        AppText.b2(
            '${DateTimeUtils.formatDateTimeDateOnly(appointment.appointmentBookingDate)} (${DateTimeUtils.fromTimeToStringType2(appointment.appointmentStartTime)} - ${DateTimeUtils.fromTimeToStringType2(appointment.appointmentEndTime)})'),
      ],
      trailing: const AppIcon(IconAssets.icArrowRight),
      onTap: () => context.goRouter.go(
        '${context.goRouter.location}/${AppointmentDetailPage.routePath}/${appointment.id}',
        extra: appointment,
      ),
    );
  }
}
