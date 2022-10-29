import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_app/features/doctor/domain/doctor.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../../../domain/appointment.dart';
import '../../../bloc/appointment/appointment_cubit.dart';
import 'appointment_card.dart';

class HospitalInfo extends StatelessWidget {
  const HospitalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (BuildContext context, AppointmentState state) {
        final Appointment appointment = state.appointment;
        return AppointmentCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  const RoundedRectImage(height: 40, width: 40),
                  const SizedBox(width: 12),
                  Expanded(
                      child: AppText.t0('${appointment.hospital?.hospitalName}')
                          .weight600),
                ],
              ),
              const SizedBox(height: 8),
              AppText.t1('Địa chỉ'),
              const SizedBox(height: 4),
              AppText.t1(
                      '${appointment.hospital?.hospitalAddress?.addressDetail}')
                  .weight500,
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
            ],
          ),
        );
      },
    );
  }
}
