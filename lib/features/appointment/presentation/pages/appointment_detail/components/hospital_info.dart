import 'package:flutter/material.dart';
import 'package:moli_app/features/doctor/domain/doctor.dart';
import 'package:moli_app/shared/shared.dart';

import '../../../../domain/appointment.dart';
import 'appointment_card.dart';

class HospitalInfo extends StatelessWidget {
  const HospitalInfo({super.key, required this.appointment});
  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    return AppointmentCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              const RoundedImage(size: 40),
              SizedBox(width: 12.w),
              Expanded(
                  child: AppText.t0('${appointment.hospital?.hospitalName}')
                      .weight600),
            ],
          ),
          const SizedBox(height: 8),
          AppText.t1('Địa chỉ'),
          const SizedBox(height: 4),
          AppText.t1('${appointment.hospital?.hospitalAddress?.addressDetail}')
              .weight500,
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AppText.b0('Chuyên khoa'),
              AppText.b0(
                '${appointment.doctor?.specialists.map((Specialist specialist) => specialist.specialistName).join('\n')}',
              ).weight600,
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AppText.b0('Bác sĩ'),
              AppText.b0(
                '${appointment.doctor?.name}',
              ).weight600,
            ],
          ),
        ],
      ),
    );
  }
}
