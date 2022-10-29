import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_app/features/appointment/domain/appointment.dart';
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
        return LoadingOpacity(
          isOpacity: false,
          loading: state.status.isLoading,
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: const <Widget>[
                AppointmentInfo(),
                HospitalInfo(),
                PatientInfo(),
                AppointmentSupportBar()
              ].applySeparator(separator: const SizedBox(height: 16)),
            ),
          ),
        );
      },
    );
  }
}

class AppointmentSupportBar extends StatelessWidget {
  const AppointmentSupportBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AppText.b0('CSKH'),
        AppText.b0('1900 xxxx xxxx').weight600,
      ],
    );
  }
}
