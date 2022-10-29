import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../../../domain/appointment.dart';
import '../../../../domain/appointment_update.dart';
import '../../../bloc/appointment/appointment_cubit.dart';

class AppointmentBottomModal extends StatefulWidget {
  const AppointmentBottomModal({super.key});

  @override
  State<AppointmentBottomModal> createState() => _AppointmentBottomModalState();
}

class _AppointmentBottomModalState extends State<AppointmentBottomModal> {
  late AppointmentCubit _cubit;

  late AppointmentStatus selectedOption;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<AppointmentCubit>();
    final AppointmentStatus status =
        _cubit.state.appointment.appointmentStatus ?? AppointmentStatus.all;

    if (status.isChange) {
      selectedOption = AppointmentStatus.confirm;
    } else {
      selectedOption = AppointmentStatus.cancel;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      bloc: _cubit,
      builder: (BuildContext context, AppointmentState state) {
        final Appointment appointment = state.appointment;
        return LoadingOpacity(
          loading: state.isLoading,
          isOpacity: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (appointment.appointmentStatus!.isChange) ...<Widget>[
                AppText.t0('Thao tác:')
                    .titleExtra
                    .weight500
                    .paddingSymmetric(horizontal: 16),
                const SizedBox(height: 4),
                ListTile(
                  title: AppText.b0(
                    'Xác nhận đổi',
                    color: context.colorScheme.primary,
                  ),
                  leading: AppRadio<AppointmentStatus>(
                    value: AppointmentStatus.confirm,
                    groupValue: selectedOption,
                    onChanged: (AppointmentStatus? value) => value != null
                        ? setState(() => selectedOption = value)
                        : null,
                  ),
                ),
                ListTile(
                  title: AppText.b0(
                    appointment.appointmentStatus!.isChange
                        ? 'Từ chối đổi'
                        : 'Hủy lịch',
                    color: context.colorScheme.error,
                  ),
                  leading: AppRadio<AppointmentStatus>(
                    value: AppointmentStatus.cancel,
                    groupValue: selectedOption,
                    onChanged: (AppointmentStatus? value) => value != null
                        ? setState(() => selectedOption = value)
                        : null,
                  ),
                ),
              ],
              if (selectedOption.isCancel) ...<Widget>[
                Row(
                  children: <Widget>[
                    AppText.b0(
                      '*',
                      color: context.colorScheme.error,
                    ),
                    AppText.b0(
                      'Lý do hủy',
                      color: context.colorScheme.error,
                    ).weight500,
                  ],
                ).paddingSymmetric(horizontal: 16),
                const SizedBox(height: 8),
                AppInput.primary(
                  hintText: 'Nhập lý do bạn muốn hủy',
                  style: context.textTheme.titleLarge,
                  maxLines: 3,
                  onChanged: (String value) => _cubit.reasonChanged(value),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ).paddingSymmetric(horizontal: 16),
              ],
              const SizedBox(height: 16),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: AppOutlinedButton(
                        expandedWith: false,
                        child: AppText.t1(context.l10n.close),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
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
                      onPressed: () async {
                        if (selectedOption.isCancel &&
                            (state.reason.invalid ||
                                StringUtils.isNullOrBlank(
                                    state.reason.value))) {
                          SmoothDialog(
                            context: context,
                            path: ImageAssets.warning,
                            imageHeight: 200,
                            imageWidth: 200,
                            titleString: 'Lưu ý',
                            contentString:
                                'Vui lòng nhập lí do bạn muốn hủy lịch hẹn!',
                            mode: SmoothMode.asset,
                            dialogType: DialogType.error,
                          );
                        } else if (selectedOption != AppointmentStatus.all) {
                          if (selectedOption.isConfirm) {
                            final bool result = await context.showConfirmDialog(
                              title: const Text('Lưu ý'),
                              content: const Text(
                                  'Bạn có chắc muốn xác nhận đổi lịch khám này chứ?'),
                            );
                            if (result && appointment.appointmentUuid != null) {
                              _cubit.updateAppointment(
                                  appointment.appointmentUuid ?? '',
                                  const AppointmentUpdateRequest(
                                    appointmentStatus:
                                        AppointmentStatus.confirm,
                                  ));
                            }
                          } else if (selectedOption.isCancel) {
                            final bool result = await context.showConfirmDialog(
                              title: const Text('Lưu ý'),
                              content: Text(
                                  'Bạn có chắc muốn ${appointment.appointmentStatus!.isConfirm ? 'hủy lịch khám' : 'từ chối đổi lịch và hủy lịch khám'} này chứ?'),
                            );
                            if (result && appointment.appointmentUuid != null) {
                              _cubit.updateAppointment(
                                appointment.appointmentUuid ?? '',
                                AppointmentUpdateRequest(
                                  appointmentStatus: AppointmentStatus.cancel,
                                  reason: state.reason.value,
                                ),
                              );
                            }
                          }
                        }
                      },
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 16),
            ],
          ),
        );
      },
    );
  }
}
