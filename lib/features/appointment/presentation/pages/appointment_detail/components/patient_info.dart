import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../../../domain/appointment.dart';
import '../../../bloc/appointment/appointment_cubit.dart';
import '../../components/appointment_card.dart';

class PatientInfo extends StatelessWidget {
  const PatientInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (BuildContext context, AppointmentState state) {
        final Appointment appointment = state.appointment;
        return AppointmentCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(child: AppText.b0('Bệnh nhân').weight500),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(child: AppText.b0('Họ và tên:')),
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
                    AppText.b0('Email:'),
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
                  AppText.b0('Điện thoại:'),
                  AppText.b0(
                    '${appointment.patient?.realPhoneNumber}',
                  ).weight600,
                ],
              ),
              const SizedBox(height: 8),
              if (!StringUtils.isNullOrBlank(
                  appointment.describeSymptoms)) ...<Widget>[
                AppText.b0('Ghi chú của bệnh nhân:'),
                const SizedBox(height: 4),
                AppText.t1('${appointment.describeSymptoms}').weight500,
              ]
            ],
          ),
        );
      },
    );
  }
}
