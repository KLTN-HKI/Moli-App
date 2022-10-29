import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../../../domain/appointment.dart';
import '../../../bloc/appointment/appointment_cubit.dart';
import 'appointment_card.dart';

class AppointmentInfo extends StatelessWidget {
  const AppointmentInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (BuildContext context, AppointmentState state) {
        final Appointment appointment = state.appointment;
        return AppointmentCard(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppText.t0('${appointment.hospital?.hospitalName}').bold,
              const SizedBox(height: 4),
              AppText.t0(
                '${appointment.appointmentStatus}',
                color: _appointmentStatusColor(
                    appointment.appointmentStatus ?? AppointmentStatus.pending),
              ).weight500,
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AppText.b0('Mã lịch hẹn'),
                  AppText.b0('${appointment.appointmentCode}').weight600,
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AppText.b0('Ngày khám'),
                  AppText.b0(
                          '${DateTimeUtils.formatDateTimeDateOnly(appointment.appointmentBookingDate)}')
                      .weight600,
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AppText.b0('Giờ khám'),
                  AppText.b0(
                    '${DateTimeUtils.fromTimeToStringType2(appointment.appointmentStartTime)} - ${DateTimeUtils.fromTimeToStringType2(appointment.appointmentEndTime)}',
                    color: context.colorScheme.error,
                  ).weight600,
                ],
              ),
              const Divider(),
              if (!StringUtils.isNullOrBlank(state.appointment.reason))
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    AppText.b0(
                        'Lý do ${state.appointment.appointmentStatus!.isChange ? 'đổi lịch' : ' hủy lịch'}:'),
                    AppText.b0(
                      '${appointment.reason}',
                      color: context.colorScheme.error,
                    ).weight600,
                  ],
                )
              else ...<Widget>[
                _DisplayCountdown(
                  appointment.appointmentBookingDate
                      ?.copyWith(
                        hour: appointment.appointmentStartTime?.hour,
                        minute: appointment.appointmentStartTime?.minute,
                      )
                      .difference(DateTime.now()),
                ),
                const SizedBox(height: 8),
                AppText.b2(
                  'Vui lòng có mặt ở địa điểm khám trước 30 phút',
                  color: context.colorScheme.error,
                ).bold,
              ],
            ],
          ),
        );
      },
    );
  }

  Color _appointmentStatusColor(AppointmentStatus status) {
    switch (status) {
      case AppointmentStatus.confirm:
        return ColorPalettes.primary40;
      case AppointmentStatus.change:
        return ColorPalettes.blueAccent;
      case AppointmentStatus.cancel:
        return ColorPalettes.error40;
      case AppointmentStatus.pending:
        return ColorPalettes.coreWarning;
      case AppointmentStatus.all:
        return ColorPalettes.neutral10;
    }
  }
}

class _DisplayCountdown extends StatefulWidget {
  const _DisplayCountdown(this.duration);

  final Duration? duration;

  @override
  State<_DisplayCountdown> createState() => __DisplayCountdownState();
}

class __DisplayCountdownState extends State<_DisplayCountdown> {
  Timer? countdownTimer;
  late Duration scheduleDuration;

  @override
  void initState() {
    super.initState();
    scheduleDuration = widget.duration ?? Duration.zero;

    startTimer();
  }

  /// Timer related methods ///
  // Step 3
  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    const int reduceSecondsBy = 1;
    setState(() {
      final int seconds = scheduleDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        scheduleDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    countdownTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final String days = strDigits(scheduleDuration.inDays);
    final String hours = strDigits(scheduleDuration.inHours.remainder(24));
    final String minutes = strDigits(scheduleDuration.inMinutes.remainder(60));
    return AppText.b1(scheduleDuration.inDays > 0
        ? 'Lịch khám sẽ bắt đầu trong $days ngày $hours giờ'
        : '(Lịch khám sẽ bắt đầu trong $hours giờ $minutes phút)');
  }
}
