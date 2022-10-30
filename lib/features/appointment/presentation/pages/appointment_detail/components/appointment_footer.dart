import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_app/features/appointment/presentation/pages/appointment_detail/components/appointment_modal.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../../../domain/appointment.dart';
import '../../../bloc/appointment/appointment_cubit.dart';

class AppointmentFooter extends StatefulWidget {
  const AppointmentFooter({super.key});

  @override
  State<AppointmentFooter> createState() => _AppointmentFooterState();
}

class _AppointmentFooterState extends State<AppointmentFooter> {
  late AppointmentCubit _cubit;
  final TextEditingController reasonController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cubit = context.read<AppointmentCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      bloc: _cubit,
      builder: (BuildContext context, AppointmentState state) {
        final Appointment appointment = state.appointment;
        if (appointment.appointmentStatus != null &&
            (appointment.appointmentStatus!.isChange ||
                appointment.appointmentStatus!.isConfirm)) {
          return AppOutlinedButton(
            onPressed: () {
              context.showDefaultBottomModal<int>(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  child: const AppointmentBottomModal());
            },
            primary: appointment.appointmentStatus!.isChange
                ? ColorPalettes.blueAccent
                : context.colorScheme.error,
            child: AppText.t1(
              appointment.appointmentStatus!.isChange
                  ? 'Xác nhận đổi '
                  : 'Hủy lịch khám',
              color: appointment.appointmentStatus!.isChange
                  ? ColorPalettes.blueAccent
                  : context.colorScheme.error,
            ).weight500,
          ).marginAll(16);
        }
        return const SizedBox();
      },
    );
  }
}
