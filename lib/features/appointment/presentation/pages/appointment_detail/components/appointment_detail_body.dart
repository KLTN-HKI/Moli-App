import 'package:flutter/material.dart';
import 'package:moli_app/shared/shared.dart';

import 'appointment_info.dart';
import 'hospital_info.dart';
import 'patient_info.dart';

class AppointmentDetailBody extends StatelessWidget {
  const AppointmentDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.w),
      children: <Widget>[
        const AppointmentInfo(),
        const SizedBox(height: 16),
        const HospitalInfo(),
        const SizedBox(height: 16),
        AppText.b1('Bệnh nhân'),
        const SizedBox(height: 8),
        const PatientInfo(),
        const SizedBox(height: 16),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText.b0('CSKH'),
            AppText.b0('1900').weight600,
          ],
        )
      ],
    );
  }
}
