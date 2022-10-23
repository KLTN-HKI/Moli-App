import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/user_notification.dart';

part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(const NotificationState()) {
    on<_Add>(_onAdd, transformer: sequential());
    on<_Clear>(_onClear, transformer: restartable());
    on<_Check>(_onCheck);
    on<_Read>(_onRead, transformer: sequential());
  }
  FutureOr<void> _onAdd(_Add event, Emitter<NotificationState> emit) {
    final Set<UserNotification> data = state.notificationsLastest;
    emit(NotificationState(
      notificationsLastest: <UserNotification>{event.notification, ...data},
      newEst: true,
    ));
  }

  FutureOr<void> _onClear(_Clear event, Emitter<NotificationState> emit) {
    emit(const NotificationState());
  }
}

FutureOr<void> _onCheck(_Check event, Emitter<NotificationState> emit) async {
  /* final Set<UserNotification> data = state.notificationsLastest;
    final bool newEst = await _repository.checkNotification() == 1;
    emit(NotificationState(notificationsLastest: data, newEst: newEst)); */
}

FutureOr<void> _onRead(_Read event, Emitter<NotificationState> emit) {
  /* _repository.readNotification(event.notificationId);
    final List<UserNotification> data = state.notificationsLastest.toList();
    final int index = data
        .indexWhere((UserNotification noti) => noti.id == event.notificationId);
    if (index != -1 && data[index].isRead == 0) {
      emit(
        NotificationState(notificationsLastest: data.toSet()),
      );
      data[index] = data[index].copyWith(isRead: 1);
      emit(
        NotificationState(notificationsLastest: data.toSet()),
      );
    } */
}
