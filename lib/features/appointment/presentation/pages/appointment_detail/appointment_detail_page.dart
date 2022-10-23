import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:moli_app/features/appointment/domain/appointment.dart';
import 'package:moli_app/features/appointment/domain/appointment_update.dart';
import 'package:moli_app/features/appointment/presentation/bloc/appointment_list/appointment_list_cubit.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../bloc/appointment/appointment_cubit.dart';
import 'components/appointment_detail_body.dart';

class AppointmentDetailPage extends StatefulWidget {
  const AppointmentDetailPage({super.key, required this.id});

  final String id;

  static const String routePath = 'detail';

  @override
  State<AppointmentDetailPage> createState() => _AppointmentDetailPageState();
}

class _AppointmentDetailPageState extends State<AppointmentDetailPage> {
  late AppointmentCubit _cubit;
  TextEditingController reasonController = TextEditingController();
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
            title: 'Thành công',
            content:
                'Bạn đã ${state.appointment.appointmentStatus?.acction()} lịch khám thành công',
            mode: SmoothMode.asset,
            // onDismiss: () => context.goRouter.go(Routes.appointment),
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
          bottomNavigationBar: BlocBuilder<AppointmentCubit, AppointmentState>(
            builder: (BuildContext context, AppointmentState state) {
              if (state.appointment.appointmentStatus !=
                  AppointmentStatus.cancel) {
                return AppOutlinedButton(
                  onPressed: () async {
                    final int? action =
                        await context.showDefaultBottomModal<int>(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          AppText.t0(
                            'Lý do hủy',
                            color: context.colorScheme.error,
                          ).weight500,
                          const SizedBox(height: 8),
                          AppInput.primary(
                            hintText: 'Nhập lý do bạn muốn hủy',
                            controller: reasonController,
                            onChanged: (String p0) {},
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Expanded(
                                child: AppOutlinedButton(
                                    expandedWith: false,
                                    child: AppText.t1(context.l10n.cancel),
                                    onPressed: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                    }),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: AppElevatedButton(
                                  expandedWith: false,
                                  primary: context.colorScheme.error,
                                  child: AppText.t1(
                                    context.l10n.confirm,
                                    color: ColorPalettes.white,
                                  ),
                                  onPressed: () {
                                    if (reasonController.text.isEmpty) {
                                      SmoothDialog(
                                        context: context,
                                        path: ImageAssets.warning,
                                        imageHeight: 200,
                                        imageWidth: 200,
                                        title: 'Lưu ý',
                                        content:
                                            'Vui lòng nhập lí do bạn muốn hủy lịch hẹn!',
                                        mode: SmoothMode.asset,
                                        dialogType: DialogType.error,
                                      );
                                    } else {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop(1);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 16),
                    );
                    if (!mounted) {
                      return;
                    }
                    if (action != null && action == 1) {
                      final bool result = await context.showConfirmDialog(
                        title: const Text('Lưu ý'),
                        content:
                            const Text('Bạn có chắc muốn hủy lịch khám không?'),
                      );
                      if (result && state.appointment.appointmentUuid != null) {
                        _cubit.updateAppointment(
                            widget.id,
                            AppointmentUpdateRequest(
                              appointmentStatus: AppointmentStatus.cancel,
                              reason: reasonController.text,
                            ));
                      }
                    }
                  },
                  child: const Text('Hủy lịch'),
                ).marginAll(16);
              }
              return const SizedBox();
            },
          ),
        );
      },
    );
  }
}
