import 'dart:developer' as dev;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class MoliMessaging {
  const MoliMessaging._();

  /// Singleton instance of AntoreeMessaging Helper
  static MoliMessaging? _instance;

  /// Get instance of this class
  static MoliMessaging get instance => _instance ??= const MoliMessaging._();

  static FirebaseMessaging? _messaging;

  /// If you're going to use other Firebase services in the background, such as
  /// Firestore, make sure you call `initializeApp` before using other Firebase services.
  /// 1. It must not be an anonymous function.
  /// 2. It must be a top-level function (e.g. not a class method which requires initialization).
  static Future<void> initialize() async {
    _messaging ??= FirebaseMessaging.instance;
    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
  }

  /// Set a message handler function which is called when the app is in the
  /// background or terminated.
  static Future<void> _onBackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();

    if (kDebugMode) {
      dev.log(
          name: 'AntoreeFirebaseMessaging',
          '\x1B[35mHandling a background message: ${message.messageId}');
    }
  }

  /// Prompts the user for notification permissions.
  Future<void> requestPermission() async {
    final NotificationSettings settings = await _messaging!.requestPermission(
      announcement: true,
      carPlay: true,
      criticalAlert: true,
    );
    await _messaging!.setForegroundNotificationPresentationOptions(
      sound: true,
    );

    if (kDebugMode) {
      dev.log(
          name: runtimeType.toString(),
          '\x1B[35mUser granted permission: ${settings.authorizationStatus}');
    }
  }

  /// Returns the default FCM token for this device.
  Future<String?> getToken() async {
    final String? token = await _messaging!.getToken(
        vapidKey:
            'BInMa9r9EQ0cdH7m8hADlAHvQAcFp2J5hDoANcWuV6zFqJ8rQvpSu7Cb1mm-j5VEHoEWmQuQmE2MGcl6wyoNid0');

    if (kDebugMode) {
      dev.log(
          name: runtimeType.toString(),
          '\x1B[35m[AntoreeFirebaseMessaging] User get FCM token: $token');
    }

    return token;
  }

  /// Removes access to an FCM token previously authorized.
  Future<void> deleteToken() {
    if (kDebugMode) {
      dev.log(
          name: runtimeType.toString(),
          '\x1B[35m[AntoreeFirebaseMessaging] User delete FCM token');
    }
    return _messaging!.deleteToken();
  }

  /// This should be used to determine whether specific notification interaction
  /// should open the app with a specific purpose (e.g. opening a chat message,
  /// specific screen etc).
  Future<RemoteMessage?> getInitialMessage() => _messaging!.getInitialMessage();

  /// Returns a Stream that is called when an incoming FCM payload is received
  /// whilst the Flutter instance is in the foreground.
  static Stream<RemoteMessage> get onMessage => FirebaseMessaging.onMessage;

  /// Returns a [Stream] that is called when a user presses a notification message displayed via FCM.
  static Stream<RemoteMessage> get onMessageOpenedApp =>
      FirebaseMessaging.onMessageOpenedApp;
}
