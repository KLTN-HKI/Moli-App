import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/config/config.dart';
import 'package:moli_app/features/notification/application/bloc/notification_bloc.dart';
import 'package:moli_app/features/notification/data/notification_repository.dart';
import 'package:moli_app/features/notification/data/notification_repository_api.dart';
import 'package:moli_app/features/notification/data/notification_repository_local.dart';
import 'package:moli_app/features/notification/domain/user_notification.dart';
import 'package:moli_shared/moli_shared.dart';

part 'notification_list_cubit.freezed.dart';
part 'notification_list_state.dart';

class NotificationListCubit extends Cubit<NotificationListState> {
  NotificationListCubit()
      : _repository = getIt<NotificationRepositoryApi>(),
        _repositoryLocal = getIt<NotificationRepositoryLocal>(),
        _bloc = getIt<NotificationBloc>(),
        super(const NotificationListState());

  final NotificationRepository _repository;
  final NotificationRepositoryLocal _repositoryLocal;
  final NotificationBloc _bloc;

  @override
  Future<void> close() {
    saveDataLocal();
    _bloc.add(const NotificationEvent.clear());
    return super.close();
  }

  Future<void> fetchData() async {
    try {
      emit(state.copyWith(
          status: StateStatus.loading, exception: null, isLoading: false));
      final UserNotificationList data = await _repository
          .fetchUserNotificationList(data: <String, dynamic>{});
      emit(state.copyWith(
        status: StateStatus.success,
        notificationlist: data,
        isLoading: false,
        exception: null,
      ));
      _bloc.add(const NotificationEvent.clear());
    } on NetworkException catch (e) {
      emit(state.copyWith(
        status: StateStatus.failure,
        isLoading: false,
        exception: e,
      ));
      loadDataLocal();
    }
  }

  Future<void> loadMoreData() async {
    try {
      if (!state.isLoading && state.notificationlist.pagination.hasMore) {
        emit(state.copyWith(exception: null, isLoading: true));

        final UserNotificationList data =
            await _repository.fetchUserNotificationList(data: <String, dynamic>{
          'page': state.notificationlist.pagination.currentPage + 1,
        });

        emit(state.copyWith(
          status: StateStatus.success,
          notificationlist: data.copyWith(
              notifications:
                  state.notificationlist.notifications + data.notifications),
          isLoading: false,
          exception: null,
        ));
      }
    } on NetworkException catch (e) {
      emit(state.copyWith(
        status: StateStatus.failure,
        isLoading: false,
        exception: e,
      ));
      loadDataLocal();
    }
  }

  Future<void> saveDataLocal() async {
    if (state.exception == null) {
      _repositoryLocal
          .saveUserNotificationList(state.notificationlist.notifications);
    }
  }

  Future<void> loadDataLocal() async {
    if (state.exception != null &&
        state.notificationlist.notifications.isEmpty) {
      emit(state.copyWith(
          status: StateStatus.loading, exception: null, isLoading: false));

      final UserNotificationList data = await _repositoryLocal
          .fetchUserNotificationList(data: <String, dynamic>{});

      emit(state.copyWith(
        status: StateStatus.success,
        notificationlist: data,
        isLoading: false,
        exception: null,
      ));
    }
  }

  Future<void> readNotification(int notificationId) async {
    try {
      _repository.readNotification(notificationId);
      final List<UserNotification> data =
          state.notificationlist.notifications.toList();

      final int index =
          data.indexWhere((UserNotification noti) => noti.id == notificationId);
      if (index != -1 && !data[index].read) {
        data[index] = data[index].copyWith(read: true);
        emit(state.copyWith(
          status: StateStatus.success,
          notificationlist:
              state.notificationlist.copyWith(notifications: data),
          isLoading: false,
          exception: null,
        ));
      }
    } on NetworkException catch (e) {
      emit(state.copyWith(
        status: StateStatus.failure,
        isLoading: false,
        exception: e,
      ));
    }
  }
}
