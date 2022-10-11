import 'package:hive_flutter/hive_flutter.dart';
import 'package:moli_app/constants/app_constant.dart';
import 'package:moli_app/shared/services/service.dart';

import '../../../appointment/domain/appointment.dart';
import '../user_notification.dart';

part 'user_notification_hive.g.dart';

@HiveType(typeId: AppConstant.hiveNotification)
class UserNotificationHive extends HiveBox {
  UserNotificationHive() : super(boxName: boxKey);

  static const String boxKey = 'UserNotificationHive';

  @HiveField(1)
  late AppointmentChannel? channelId;

  @HiveField(2)
  late Appointment? appointment;

  @HiveField(3)
  late String? notificationDetail;

  @HiveField(4)
  late DateTime? createdAt;
}

extension ToUserNotification on UserNotificationHive {
  UserNotification toUserNotification() => UserNotification(
        id: int.tryParse(id) ?? 0,
        channelId: channelId,
        appointment: appointment,
        notificationDetail: notificationDetail,
        createdAt: createdAt,
      );
}

extension ToUserNotificationHive on UserNotification {
  UserNotificationHive toUserNotificationHive() => UserNotificationHive()
    ..id = id.toString()
    ..channelId = channelId
    ..appointment = appointment
    ..notificationDetail = notificationDetail
    ..createdAt = createdAt;
}
