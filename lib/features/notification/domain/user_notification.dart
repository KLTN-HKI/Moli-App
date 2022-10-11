import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/common/common.dart';

part 'user_notification.freezed.dart';
part 'user_notification.g.dart';

enum AppointmentStatus {
  @JsonValue('PENDING')
  pending('PENDING'),
  @JsonValue('CONFIRM')
  confirm('CONFIRM'),
  @JsonValue('CHANGE')
  change('CHANGE'),
  @JsonValue('CANCEL')
  cancel('CANCEL');

  const AppointmentStatus(this.status);
  final String status;

  @override
  String toString() {
    switch (status) {
      case 'PENDING':
        return 'Chờ xác nhận';
      case 'CONFIRM':
        return 'Đã xác nhận';
      case 'CHANGE':
        return 'Đổi';
      case 'CANCEL':
        return 'Đã hủy';
      default:
        return '';
    }
  }
}

enum AppointmentChannel {
  @JsonValue('APPOINTMENT_REQUEST')
  request('APPOINTMENT_REQUEST'),

  @JsonValue('APPOINTMENT_CANCEL')
  cancel('APPOINTMENT_CANCEL'),

  @JsonValue('APPOINTMENT_REMIND')
  remind('APPOINTMENT_REMIND');

  const AppointmentChannel(this.type);
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
      default:
        return '';
    }
  }
}

@freezed
class UserNotification with _$UserNotification {
  const factory UserNotification({
    @JsonKey() required int id,
    @JsonKey() AppointmentChannel? channelId,
    @JsonKey() @Default(0) int type,
    @JsonKey() @Default(0) int status,
    @JsonKey() @Default(0) int isRead,
    @JsonKey() String? image,
    @JsonKey() int? contentId,
    @JsonKey() String? content,
    @JsonKey() @Default(<String>[]) List<String> contentBold,
    @JsonKey(fromJson: DateTimeUtils.parseDateTime, toJson: DateTimeUtils.formatDateTime)
        DateTime? createdAt,
    // orther
    @JsonKey() String? occurredAt,
    @JsonKey() String? reason,
    @JsonKey() String? absentFrom,
    @JsonKey() String? absentTo,
    @JsonKey() String? confirmUrl,
    @JsonKey() String? unconfirmUrl,
    @JsonKey() String? reviewUrl,
    @JsonKey() String? inviteUrl,
  }) = _UserNotification;

  // To JSON
  const UserNotification._();

  factory UserNotification.fromJson(JSON json) =>
      _$UserNotificationFromJson(json);
}

@freezed
class UserNotificationList with _$UserNotificationList {
  const factory UserNotificationList({
    @JsonKey()
    @Default(<UserNotification>[])
        List<UserNotification> notificationDataList,
    @JsonKey() @Default(Pagination()) Pagination pagination,
  }) = _UserNotificationList;

  // To JSON
  const UserNotificationList._();

  factory UserNotificationList.fromJson(JSON json) =>
      _$UserNotificationListFromJson(json);
}
