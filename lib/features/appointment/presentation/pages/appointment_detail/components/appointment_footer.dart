import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_app/features/appointment/presentation/pages/appointment_detail/components/appointment_modal.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../../../domain/appointment.dart';
import '../../../../domain/appointment_update.dart';
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
      builder: (BuildContext context, AppointmentState state) {
        final Appointment appointment = state.appointment;
        if (appointment.appointmentStatus != null &&
            (appointment.appointmentStatus!.isChange ||
                appointment.appointmentStatus!.isConfirm)) {
          return AppOutlinedButton(
            onPressed: () async {
              final int? action = await context.showDefaultBottomModal<int>(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // padding: const EdgeInsets.symmetric(vertical: 12),
                  child: const AppointmentBottomModal()
                  // child: Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   mainAxisSize: MainAxisSize.min,
                  //   children: <Widget>[
                  //     AppText.t0(
                  //       'Lý do hủy',
                  //       color: context.colorScheme.error,
                  //     ).weight500,
                  //     const SizedBox(height: 8),
                  //     AppInput.primary(
                  //       hintText: 'Nhập lý do bạn muốn hủy',
                  //       controller: reasonController,
                  //       style: context.textTheme.titleLarge,
                  //       maxLines: 3,
                  //       onChanged: (String p0) {},
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(8)),
                  //     ),
                  //     const SizedBox(height: 16),
                  //     Row(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: <Widget>[
                  //         Expanded(
                  //           child: AppOutlinedButton(
                  //               expandedWith: false,
                  //               child: AppText.t1(context.l10n.close),
                  //               onPressed: () {
                  //                 Navigator.of(context, rootNavigator: true)
                  //                     .pop();
                  //               }),
                  //         ),
                  //         const SizedBox(width: 16),
                  //         Expanded(
                  //           child: AppElevatedButton(
                  //             expandedWith: false,
                  //             primary: context.colorScheme.error,
                  //             child: AppText.t1(
                  //               context.l10n.confirm,
                  //               color: ColorPalettes.white,
                  //             ),
                  //             onPressed: () {
                  //               if (reasonController.text.isEmpty) {
                  //                 SmoothDialog(
                  //                   context: context,
                  //                   path: ImageAssets.warning,
                  //                   imageHeight: 200,
                  //                   imageWidth: 200,
                  //                   titleString: 'Lưu ý',
                  //                   contentString:
                  //                       'Vui lòng nhập lí do bạn muốn hủy lịch hẹn!',
                  //                   mode: SmoothMode.asset,
                  //                   dialogType: DialogType.error,
                  //                 );
                  //               } else {
                  //                 Navigator.of(context, rootNavigator: true)
                  //                     .pop(1);
                  //               }
                  //             },
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ).paddingSymmetric(horizontal: 16),
                  );
              if (!mounted) {
                return;
              }
              if (action != null && action == 1) {
                final bool result = await context.showConfirmDialog(
                  title: const Text('Lưu ý'),
                  content: const Text('Bạn có chắc muốn hủy lịch khám không?'),
                );
                if (result && state.appointment.appointmentUuid != null) {
                  _cubit.updateAppointment(
                      appointment.appointmentUuid ?? '',
                      AppointmentUpdateRequest(
                        appointmentStatus: AppointmentStatus.cancel,
                        reason: reasonController.text,
                      ));
                }
              }
            },
            primary: context.colorScheme.error,
            child: AppText.t1(
              appointment.appointmentStatus!.isChange
                  ? 'Xác nhận đổi '
                  : 'Hủy lịch khám',
              color: context.colorScheme.error,
            ).weight500,
          ).marginAll(16);
        }
        return const SizedBox();
      },
    );
  }
}
