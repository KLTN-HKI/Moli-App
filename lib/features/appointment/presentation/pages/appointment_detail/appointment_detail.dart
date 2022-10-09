import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_app/constants/image_assets.dart';
import 'package:moli_app/features/appointment/domain/appointment.dart';
import 'package:moli_app/router/router.dart';
import 'package:moli_app/shared/shared.dart';

import '../../bloc/appointment/appointment_cubit.dart';
import 'components/appointment_detail_body.dart';

class AppointmentDetailPage extends StatefulWidget {
  const AppointmentDetailPage({
    super.key,
    required this.id,
    this.extra,
  });

  final int id;
  final Object? extra;

  static const String routePath = 'appointment-detail';

  @override
  State<AppointmentDetailPage> createState() => _AppointmentDetailPageState();
}

class _AppointmentDetailPageState extends State<AppointmentDetailPage> {
  late Appointment _appointment;
  late AppointmentCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = AppointmentCubit();
    if (widget.extra != null && widget.extra is Appointment) {
      _appointment = widget.extra! as Appointment;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppointmentCubit>.value(
      value: _cubit,
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
                content: 'Bạn đã hủy lịch khám thành công',
                mode: SmoothMode.asset,
                onDismiss: () => context.goRouter.go(Routes.appointment),
              );
            } else if (state.exception != null) {
              context.showNetworkExceptionDialog(state.exception!);
            }
          },
          child: SafeArea(
            child: AppointmentDetailBody(appointment: _appointment),
          ),
        ),
        bottomNavigationBar:
            _appointment.appointmentStatus != AppointmentStatus.cancel
                ? AppOutlinedButton(
                    onPressed: () async {
                      final bool result = await context.showConfirmDialog(
                        title: const Text('Lưu ý'),
                        content:
                            const Text('Bạn có chắc muốn hủy lịch khám không?'),
                      );
                      if (result && _appointment.appointmentUuid != null) {
                        _cubit.cancelAppointment(_appointment.appointmentUuid!);
                      }
                    },
                    child: const Text('Hủy lịch'),
                  ).marginAll(16)
                : null,
      ),
    );
  }
}
