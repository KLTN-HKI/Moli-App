import 'package:flutter/material.dart';
import 'package:moli_app/features/appointment/domain/appointment.dart';
import 'package:moli_shared/moli_shared.dart';

import 'appointment_info.dart';
import 'hospital_info.dart';
import 'patient_info.dart';

class AppointmentDetailBody extends StatelessWidget {
  const AppointmentDetailBody({
    super.key,
    required this.appointment,
  });

  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      children: <Widget>[
        AppointmentInfo(appointment: appointment),
        const SizedBox(height: 16),
        HospitalInfo(appointment: appointment),
        const SizedBox(height: 16),
        AppText.b1('Bệnh nhân'),
        const SizedBox(height: 8),
        PatientInfo(appointment: appointment),
        const SizedBox(height: 16),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppText.b0('CSKH'),
            AppText.b0('1900').weight600,
          ],
        )
      ],
    );
  }
}
