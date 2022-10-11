import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/config/config.dart';
import 'package:moli_app/features/notification/application/bloc/notification_bloc.dart';
import 'package:moli_app/features/notification/data/notification_repository.dart';
import 'package:moli_app/features/notification/data/notification_repository_api.dart';
import 'package:moli_app/features/notification/data/notification_repository_local.dart';
import 'package:moli_app/features/notification/domain/user_notification.dart';
import 'package:moli_app/shared/shared.dart';

part 'notification_list_cubit.freezed.dart';
part 'notification_list_state.dart';

class NotificationListCubit extends Cubit<NotificationListState> {
  NotificationListCubit()
      : _repository = getIt<NotificationRepositoryApi>(),
        _repositoryLocal = getIt<NotificationRepositoryLocal>(),
        _bloc = getIt<NotificationBloc>(),
        super(const NotificationListState.initial());

  final NotificationRepository _repository;
  final NotificationRepositoryLocal _repositoryLocal;
  final NotificationBloc _bloc;

  Future<void> fetchData() async {
    emit(state.copyWith(exception: null, isLoading: true));
    try {
      final UserNotificationList data = await _repository
          .fetchUserNotificationList(data: <String, dynamic>{});

      emit(state.copyWith(
        notificationlist: data,
        isLoading: false,
        exception: null,
      ));
    } on NetworkException catch (e) {
      emit(state.copyWith(
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
          notificationlist: data.copyWith(
            notificationDataList:
                state.notificationlist.notificationDataList + data.notificationDataList,
          ),
          isLoading: false,
          exception: null,
        ));
      }
    } on NetworkException catch (e) {
      emit(state.copyWith(
        isLoading: false,
        exception: e,
      ));
      loadDataLocal();
    }
  }

  Future<void> saveDataLocal() async {
    if (state.exception == null) {
      _repositoryLocal
          .saveUserNotificationList(state.notificationlist.notificationDataList);
    }
  }

  Future<void> loadDataLocal() async {
    if (state.exception != null &&
        state.notificationlist.notificationDataList.isEmpty) {
      emit(state.copyWith(exception: null, isLoading: true));

      final UserNotificationList data = await _repositoryLocal
          .fetchUserNotificationList(data: <String, dynamic>{});

      emit(state.copyWith(
        notificationlist: data,
        isLoading: false,
        exception: null,
      ));
    }
  }

  @override
  Future<void> close() {
    saveDataLocal();
    _bloc.add(const NotificationEvent.clear());
    return super.close();
  }
}
