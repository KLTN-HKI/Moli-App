part of 'notification_list_cubit.dart';

@freezed
class NotificationListState with _$NotificationListState {
  const factory NotificationListState.initial({
    @Default(UserNotificationList()) UserNotificationList notificationlist,
    @Default(false) bool isLoading,
    NetworkException? exception,
  }) = _Initial;
}
