import 'package:flutter/material.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../../../domain/appointment.dart';
import 'appointment_card.dart';

class PatientInfo extends StatelessWidget {
  const PatientInfo({super.key, required this.appointment});
  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    return AppointmentCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AppText.b0('Họ và tên'),
              AppText.b0(
                appointment.patient?.name ?? 'Chưa cập nhật thông tin',
              ).weight600,
            ],
          ),
          const SizedBox(height: 8),
          if (appointment.patient?.name == null) ...<Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AppText.b0('Email'),
                AppText.b0(
                  appointment.patient?.email ?? 'Chưa cập nhật thông tin',
                ).weight600,
              ],
            ),
            const SizedBox(height: 8),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AppText.b0('Điện thoại'),
              AppText.b0(
                '${appointment.patient?.realPhoneNumber}',
              ).weight600,
            ],
          ),
        ],
      ),
    );
  }
}
