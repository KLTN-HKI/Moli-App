part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.add(UserNotification notification) = _Add;
  const factory NotificationEvent.clear() = _Clear;
}
