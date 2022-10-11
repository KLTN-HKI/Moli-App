import 'package:hive_flutter/hive_flutter.dart';
import 'package:moli_app/shared/shared.dart';

import '../domain/hive/user_notification_hive.dart';
import '../domain/user_notification.dart';
import 'notification_repository.dart';

class NotificationRepositoryLocal implements NotificationRepository {
  const NotificationRepositoryLocal._();

  static Future<NotificationRepositoryLocal> initialize() async {
    Hive.registerAdapter<UserNotificationHive>(UserNotificationHiveAdapter());

    await Hive.openBox<UserNotificationHive>(UserNotificationHive.boxKey);

    return const NotificationRepositoryLocal._();
  }

  @override
  Future<UserNotificationList> fetchUserNotificationList(
      {required JSON data}) async {
    final Iterable<UserNotificationHive>? data = KeyValueStorageBase.instance
        .getItems<UserNotificationHive>(UserNotificationHive.boxKey);

    if (data != null) {
      final List<UserNotification> list = data
          .map((UserNotificationHive item) => item.toUserNotification())
          .toList()
        ..sort((UserNotification a, UserNotification b) {
          if (a.createdAt != null && b.createdAt != null) {
            return b.createdAt!.compareTo(a.createdAt!);
          }
          return 0;
        });

      return UserNotificationList(notifications: list);
    }

    return const UserNotificationList();
  }

  Future<void> saveUserNotificationList(List<UserNotification> items) async {
    final Iterable<UserNotificationHive> data =
        items.map((UserNotification e) => e.toUserNotificationHive());

    await KeyValueStorageBase.instance
        .saveItems<UserNotificationHive>(items: data);
  }
}
