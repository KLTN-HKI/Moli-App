import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:moli_app/config/config.dart';
import 'package:moli_app/constants/constants.dart';
import 'package:moli_app/features/notification/application/bloc/notification_bloc.dart';
import 'package:moli_app/router/router.dart';
import 'package:moli_app/router/routing.dart';
import 'package:moli_app/shared/shared.dart';

import '../domain/user_notification.dart';

class NotificationService {
  const NotificationService._();

  static Future<void> initialize() async {
    await MoliMessaging.instance.requestPermission();
    _onInitialMessage(await MoliMessaging.instance.getInitialMessage());

    MoliMessaging.onMessage.listen(_onMessage);
    MoliMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);
  }

  static void _onMessage(RemoteMessage message) {
    final Map<String, dynamic> json = message.data;
    final BuildContext? context = moliNavigatorKey.currentContext;

    if (json['channel'] == 'APPOINTMENT_REMIND' && context != null) {
      showSnackbar(context, json);
    }
    if (message.data['notification'] is String) {
      final UserNotification notification = UserNotification.fromJson(
          jsonDecode(message.data['notification'] as String) as JSON);
      getIt<NotificationBloc>().add(NotificationEvent.add(notification));
    }
  }

  static void _onMessageOpenedApp(RemoteMessage message) {
    if (message.data['notification'] is String) {
      final UserNotification notification = UserNotification.fromJson(
          jsonDecode(message.data['notification'] as String) as JSON);
      getIt<NotificationBloc>().add(NotificationEvent.add(notification));

      moliNavigatorKey.currentContext?.goRouter.go(Routes.notification);
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
      onTap: () => ScaffoldMessenger.of(context).removeCurrentSnackBar(),
      child: DefaultTextStyle(
        style: TextStyle(fontSize: 12.w, color: ColorPalettes.neutral10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '${json['details']}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    ),
    elevation: 10,
    duration: const Duration(seconds: 5),
    backgroundColor: ColorPalettes.white,
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.r),
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
