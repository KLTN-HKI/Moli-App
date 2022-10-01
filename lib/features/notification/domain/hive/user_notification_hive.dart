import 'package:hive_flutter/hive_flutter.dart';
import 'package:moli_app/constants/constants.dart';
import 'package:moli_app/shared/shared.dart';

import '../user_notification.dart';

part 'user_notification_hive.g.dart';

@HiveType(typeId: AppConstant.hiveNotification)
class UserNotificationHive extends HiveBox {
  UserNotificationHive() : super(boxName: boxKey);

  static const String boxKey = 'UserNotificationHive';

  @HiveField(1)
  late String? channelId;

  @HiveField(2)
  late int type;

  @HiveField(3)
  late int status;

  @HiveField(4)
  late int isRead;

  @HiveField(5)
  late String? image;

  @HiveField(6)
  late int? contentId;

  @HiveField(7)
  late String? content;

  @HiveField(8)
  late List<String> contentBold;

  @HiveField(9)
  late DateTime? createdAt;
}

extension ToUserNotification on UserNotificationHive {
  UserNotification toUserNotification() => UserNotification(
        id: int.tryParse(id) ?? 0,
        type: type,
        status: status,
        channelId: channelId,
        isRead: isRead,
        image: image,
        contentId: contentId,
        content: content,
        contentBold: contentBold,
        createdAt: createdAt,
      );
}

extension ToUserNotificationHive on UserNotification {
  UserNotificationHive toUserNotificationHive() => UserNotificationHive()
    ..id = id.toString()
    ..type = type
    ..status = status
    ..channelId = channelId
    ..isRead = isRead
    ..image = image
    ..contentId = contentId
    ..content = content
    ..contentBold = contentBold
    ..createdAt = createdAt;
}
