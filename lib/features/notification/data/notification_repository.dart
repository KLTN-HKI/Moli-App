import 'package:moli_app/shared/shared.dart';

import '../domain/user_notification.dart';

abstract class NotificationRepository {
  Future<UserNotificationList> fetchUserNotificationList({required JSON data});
}
