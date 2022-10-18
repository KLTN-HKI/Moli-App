import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:moli_app/features/appointment/domain/appointment.dart';
import 'package:moli_app/features/appointment/domain/appointment_update.dart';
import 'package:moli_app/router/router.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../bloc/appointment/appointment_cubit.dart';
import '../../bloc/cubit/appointment_detail_cubit.dart';
import 'components/appointment_detail_body.dart';

class AppointmentDetailPage extends StatefulWidget {
  const AppointmentDetailPage({
    super.key,
    required this.id,
    this.extra,
  });

  final String id;
  final Object? extra;

  static const String routePath = 'appointment-detail';

  @override
  State<AppointmentDetailPage> createState() => _AppointmentDetailPageState();
}

class _AppointmentDetailPageState extends State<AppointmentDetailPage> {
  late AppointmentDetailCubit _detailCubit;
  late AppointmentCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<AppointmentCubit>();
    _detailCubit = AppointmentDetailCubit(widget.id);
    // _detailCubit.fetchAppointmentByUuid();
    _cubit.fetchAppointmentByUuid(widget.id);
  }

  @override
  void dispose() {
    super.dispose();
    _cubit.close();
    _detailCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<AppointmentCubit>.value(
          value: _cubit,
        ),
        BlocProvider<AppointmentDetailCubit>.value(
          value: _detailCubit,
        ),
      ],
      child: Scaffold(
        appBar: const HeaderAppBar(
          titleText: 'Lịch hẹn khám',
          routeBack: Routes.appointment,
        ),
        body: BlocListener<AppointmentCubit, AppointmentState>(
          listener: (BuildContext context, AppointmentState state) {
            if (state.isSucess) {
              SmoothDialog(
                context: context,
                path: ImageAssets.send,
                title: 'Thành công',
                content:
                    'Bạn đã ${state.appointment.appointmentStatus.toString()} lịch khám thành công',
                mode: SmoothMode.asset,
                // onDismiss: () => context.goRouter.go(Routes.appointment),
              );
            } else if (state.exception != null) {
              context.showNetworkExceptionDialog(state.exception!);
            }
          },
          child: BlocBuilder<AppointmentCubit, AppointmentState>(
            builder: (BuildContext context, AppointmentState state) {
              final Appointment appointment = state.appointment;
              return SafeArea(
                child: AppointmentDetailBody(appointment: appointment),
              );
            },
          ),
        ),
        bottomNavigationBar: BlocBuilder<AppointmentCubit, AppointmentState>(
          builder: (BuildContext context, AppointmentState state) {
            if (state.appointment.appointmentStatus !=
                AppointmentStatus.cancel) {
              return AppOutlinedButton(
                onPressed: () async {
                  final bool result = await context.showConfirmDialog(
                    title: const Text('Lưu ý'),
                    content:
                        const Text('Bạn có chắc muốn hủy lịch khám không?'),
                  );
                  if (result && state.appointment.appointmentUuid != null) {
                    _cubit.updateAppointment(
                        widget.id,
                        const AppointmentUpdateRequest(
                          appointmentStatus: AppointmentStatus.cancel,
                          reason: 'Khong muon dat nua',
                        ));
                  }
                },
                child: const Text('Hủy lịch'),
              ).marginAll(16);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
