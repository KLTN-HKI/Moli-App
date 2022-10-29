import 'package:moli_shared/moli_shared.dart';

import '../domain/user_notification.dart';

abstract class NotificationRepository {
  Future<UserNotificationList> fetchUserNotificationList({required JSON data});
  Future<void> readNotification(int notificationId);
}
