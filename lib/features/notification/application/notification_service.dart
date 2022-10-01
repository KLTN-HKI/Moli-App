import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:moli_app/config/config.dart';
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
