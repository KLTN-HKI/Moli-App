import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_app/features/appointment/presentation/pages/appointment_detail/components/appointment_card.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../../../domain/appointment.dart';
import '../../../bloc/appointment/appointment_cubit.dart';

class AppointmentNote extends StatelessWidget {
  const AppointmentNote({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (BuildContext context, AppointmentState state) {
        final Appointment appointment = state.appointment;
        return AppointmentCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppText.t1('Lý do hủy lịch:'),
              const SizedBox(height: 4),
              AppText.t1(
                '${appointment.reason}',
                color: context.colorScheme.error,
              ).weight500,
            ],
          ),
        );
      },
    );
  }
}
