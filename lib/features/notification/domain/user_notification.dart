import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/common/common.dart';

part 'user_notification.freezed.dart';
part 'user_notification.g.dart';

@freezed
class UserNotification with _$UserNotification {
  const factory UserNotification({
    @JsonKey() required int id,
    @JsonKey() String? channelId,
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
        List<UserNotification> notifications,
    @JsonKey() @Default(Pagination()) Pagination pagination,
  }) = _UserNotificationList;

  // To JSON
  const UserNotificationList._();

  factory UserNotificationList.fromJson(JSON json) =>
      _$UserNotificationListFromJson(json);
}
