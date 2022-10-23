import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_app/features/appointment/domain/appointment.dart';
import 'package:moli_app/features/appointment/presentation/pages/appointment_detail/components/appointment_note.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../../bloc/appointment/appointment_cubit.dart';
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
      return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (BuildContext context, AppointmentState state) {
        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: <Widget>[
              const AppointmentInfo(),
              const SizedBox(height: 16),
              const HospitalInfo(),
              const SizedBox(height: 16),
              AppText.b1('Bệnh nhân'),
              const SizedBox(height: 8),
              const PatientInfo(),
              if (!StringUtils.isNullOrBlank(
                  state.appointment.reason)) ...const <Widget>[
                SizedBox(height: 8),
                AppointmentNote(),
              ],
              const SizedBox(height: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AppText.b0('CSKH'),
                  AppText.b0('1900').weight600,
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
