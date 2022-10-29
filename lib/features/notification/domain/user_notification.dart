import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../appointment/domain/appointment.dart';

part 'user_notification.freezed.dart';
part 'user_notification.g.dart';

enum NotificationChannel {
  @JsonValue('APPOINTMENT_REQUEST')
  request('APPOINTMENT_REQUEST'),

  @JsonValue('APPOINTMENT_CANCEL')
  cancel('APPOINTMENT_CANCEL'),

  @JsonValue('APPOINTMENT_REMIND')
  remind('APPOINTMENT_REMIND'),

  @JsonValue('APPOINTMENT_CONFIRM')
  confirm('APPOINTMENT_CONFIRM');

  const NotificationChannel(this.type);
  final String type;

  @override
  String toString() {
    switch (type) {
      case 'APPOINTMENT_REQUEST':
        return 'Yêu cầu';
      case 'APPOINTMENT_REMIND':
        return 'Nhắc nhở';
      case 'APPOINTMENT_CANCEL':
        return 'Báo hủy';
      case 'APPOINTMENT_CONFIRM':
        return 'Xác nhận';
      default:
        return '';
    }
  }
}

@freezed
class UserNotification with _$UserNotification {
  const factory UserNotification({
    @JsonKey()  int? id,
    @JsonKey(name: 'notificationChannel') NotificationChannel? channel,
    @JsonKey(name: 'notificationDetail') String? detail,
    @JsonKey() String? appointmentUuid,
    @JsonKey() Appointment? appointment,
    @JsonKey(fromJson: DateTimeUtils.parseDateTime, toJson: DateTimeUtils.formatDateTime)
        DateTime? createdAt,
    @JsonKey() @Default(false) bool read,
  }) = _UserNotification;

  // To JSON
  const UserNotification._();

  factory UserNotification.fromJson(JSON json) =>
      _$UserNotificationFromJson(json);
}

@freezed
class UserNotificationList with _$UserNotificationList {
  const factory UserNotificationList({
    @JsonKey(name: 'notificationDataList')
    @Default(<UserNotification>[])
        List<UserNotification> notifications,
    @JsonKey() @Default(Pagination()) Pagination pagination,
  }) = _UserNotificationList;

  // To JSON
  const UserNotificationList._();

  factory UserNotificationList.fromJson(JSON json) =>
      _$UserNotificationListFromJson(json);
}
