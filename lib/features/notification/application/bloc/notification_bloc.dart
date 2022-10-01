import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/user_notification.dart';

part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(const NotificationState.initial()) {
    on<_Add>(_onAdd, transformer: sequential());
    on<_Clear>(_onClear, transformer: restartable());
  }

  FutureOr<void> _onAdd(_Add event, Emitter<NotificationState> emit) {
    final Set<UserNotification> data = state.notificationsLastest;
    emit(NotificationState.initial(
        notificationsLastest: <UserNotification>{...data, event.notification}));
  }

  FutureOr<void> _onClear(_Clear event, Emitter<NotificationState> emit) {
    emit(const NotificationState.initial());
  }
}
