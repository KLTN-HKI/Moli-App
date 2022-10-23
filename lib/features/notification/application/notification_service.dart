import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:moli_app/config/config.dart';
import 'package:moli_app/features/notification/application/bloc/notification_bloc.dart';
import 'package:moli_app/router/router.dart';
import 'package:moli_app/router/routing.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../appointment/presentation/bloc/appointment_list/appointment_list_cubit.dart';
import '../../appointment/presentation/pages/appointment_detail/appointment_detail_page.dart';
import '../domain/user_notification.dart';

class NotificationService {
  const NotificationService._();

  static Future<void> get playNotificationSound =>
      FlutterRingtonePlayer.playNotification();

  static Future<void> get runNotificationvibrate =>
      HapticFeedback.mediumImpact();

  static Future<void> initialize() async {
    const AndroidSound(1);
    await MoliMessaging.instance.requestPermission();
    _onInitialMessage(await MoliMessaging.instance.getInitialMessage());

    MoliMessaging.onMessage.listen(_onMessage);
    MoliMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);
  }

  static void _onMessage(RemoteMessage message) {
    playNotificationSound;
    final Map<String, dynamic> json = message.data;
    final BuildContext? context = moliNavigatorKey.currentContext;

    if ((json['channel'] == 'APPOINTMENT_REMIND' ||
            json['channel'] == 'APPOINTMENT_REQUEST' ||
            json['channel'] == 'APPOINTMENT_CANCEL' ||
            json['channel'] == 'APPOINTMENT_CONFIRM') &&
        context != null) {
      context.read<AppointmentListCubit>().getAppoinments();
      showSnackbar(context, json);
    }
    if (message.data['notification'] is String) {
      final UserNotification notification = UserNotification.fromJson(
          jsonDecode(message.data['notification'] as String) as JSON);
      getIt<NotificationBloc>().add(NotificationEvent.add(notification));
    }
  }

  static void _onMessageOpenedApp(RemoteMessage message) {
    if (message.data['appointmentUuid'] is String) {
      runNotificationvibrate;
      final UserNotification notification =
          UserNotification.fromJson(message.data);
      getIt<NotificationBloc>().add(NotificationEvent.add(notification));

      moliNavigatorKey.currentContext?.goRouter.go(
          '${Routes.notification}/${AppointmentDetailPage.routePath}/${notification.appointmentUuid}');
    }
  }

  static void _onInitialMessage(RemoteMessage? message) {
    if (message?.data['notification'] != null) {
      moliNavigatorKey.currentContext!.goRouter.go(Routes.notification);
    }
  }
}

Future<void> showSnackbar(
    BuildContext context, Map<String, dynamic> json) async {
  final SnackBar snackBar = SnackBar(
    content: InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        context.goRouter.go(
            '${Routes.notification}/${AppointmentDetailPage.routePath}/${json['appointmentUuid']}');
      },
      child: DefaultTextStyle(
        style: const TextStyle(fontSize: 12, color: ColorPalettes.neutral10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '${json['details']}',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    ),
    elevation: 10,
    duration: const Duration(seconds: 5),
    backgroundColor: ColorPalettes.white,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    dismissDirection: DismissDirection.horizontal,
    action: SnackBarAction(
      label: 'Close',
      textColor: ColorPalettes.primary40,
      onPressed: () => Navigator.maybePop(context),
    ),
  );
  // context.read<RequestBloc>().add(FetchRequest());
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
