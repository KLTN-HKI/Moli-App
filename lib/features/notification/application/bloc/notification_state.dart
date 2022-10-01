part of 'notification_bloc.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.initial({
    @Default(<UserNotification>{}) Set<UserNotification> notificationsLastest,
  }) = _Initial;
}
