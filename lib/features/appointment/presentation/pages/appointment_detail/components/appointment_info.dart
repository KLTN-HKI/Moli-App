import 'package:flutter/material.dart';
import 'package:moli_app/shared/shared.dart';

import '../../../../domain/appointment.dart';
import 'appointment_card.dart';

class AppointmentInfo extends StatelessWidget {
  const AppointmentInfo({super.key, required this.appointment});
  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    return AppointmentCard(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppText.t0('${appointment.hospital?.hospitalName}').bold,
          SizedBox(height: 12.w),
          AppText.t0('${appointment.appointmentStatus}'),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.b0('Mã lịch hẹn'),
              AppText.b0('${appointment.appointmentCode}').weight600,
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.b0('Ngày khám'),
              AppText.b0(
                      '${DateTimeUtils.formatDateTimeDateOnly(appointment.appointmentBookingDate)}')
                  .weight600,
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.b0('Giờ khám'),
              AppText.b0(
                '${DateTimeUtils.fromTimeToStringType2(appointment.appointmentStartTime)} - ${DateTimeUtils.fromTimeToStringType2(appointment.appointmentEndTime)}',
                color: context.colorScheme.error,
              ).weight600,
            ],
          ),
          // const SizedBox(height: 12),
        ],
      ),
    );
  }
}
