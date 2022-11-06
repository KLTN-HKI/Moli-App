import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:moli_app/features/appointment/domain/appointment.dart';
import 'package:moli_app/features/appointment/presentation/bloc/appointment_list/appointment_list_cubit.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../bloc/appointment/appointment_cubit.dart';
import 'components/appointment_detail_body.dart';
import 'components/appointment_footer.dart';

class AppointmentDetailPage extends StatefulWidget {
  const AppointmentDetailPage({super.key, required this.id});

  final String id;

  static const String routePath = 'detail';

  @override
  State<AppointmentDetailPage> createState() => _AppointmentDetailPageState();
}

class _AppointmentDetailPageState extends State<AppointmentDetailPage> {
  late AppointmentCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<AppointmentCubit>();
    _cubit.getAppointmentByUuid(widget.id);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppointmentCubit, AppointmentState>(
      listener: (BuildContext context, AppointmentState state) {
        if (state.status.isUpdated) {
          SmoothDialog(
            context: context,
            path: ImageAssets.send,
            titleString: 'Thành công',
            contentString:
                'Bạn đã ${state.appointment.appointmentStatus?.acction()} lịch khám thành công',
            mode: SmoothMode.asset,
            onDismiss: () => Navigator.of(context, rootNavigator: true).pop(),
          );
          context.read<AppointmentListCubit>().getAppoinments();
        } else if (state.exception != null) {
          context.showNetworkExceptionDialog(state.exception!);
        }
      },
      builder: (BuildContext context, AppointmentState state) {
        final Appointment appointment = state.appointment;
        return Scaffold(
          appBar: const HeaderAppBar(titleText: 'Lịch hẹn khám'),
          body: AppointmentDetailBody(appointment: appointment),
          bottomNavigationBar: const AppointmentFooter(),
        );
      },
    );
  }
}
