import 'package:hive_flutter/hive_flutter.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../../appointment/domain/appointment.dart';
import '../user_notification.dart';

part 'user_notification_hive.g.dart';

@HiveType(typeId: AppConstant.hiveNotification)
class UserNotificationHive extends HiveBox {
  UserNotificationHive() : super(boxName: boxKey);

  static const String boxKey = 'UserNotificationHive';

  @HiveField(1)
  late NotificationChannel? channel;

  @HiveField(2)
  late Appointment? appointment;

  @HiveField(3)
  late String? detail;

  @HiveField(4)
  late DateTime? createdAt;
}

extension ToUserNotification on UserNotificationHive {
  UserNotification toUserNotification() => UserNotification(
        id: int.tryParse(id) ?? 0,
        channel: channel,
        appointment: appointment,
        detail: detail,
        createdAt: createdAt,
      );
}

extension ToUserNotificationHive on UserNotification {
  UserNotificationHive toUserNotificationHive() => UserNotificationHive()
    ..id = id.toString()
    ..channel = channel
    ..appointment = appointment
    ..detail = detail
    ..createdAt = createdAt;
}
