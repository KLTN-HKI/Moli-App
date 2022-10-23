import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/config/dependency_container.dart';
import 'package:moli_app/features/appointment/data/appointment_repository.dart';
import 'package:moli_app/features/appointment/data/appointment_repository_api.dart';
import 'package:moli_app/features/appointment/domain/appointment.dart';
import 'package:moli_shared/moli_shared.dart';

part 'appointment_list_state.dart';
part 'appointment_list_cubit.freezed.dart';

class AppointmentListCubit extends Cubit<AppointmentListState> {
  AppointmentListCubit()
      : _repository = getIt<AppointmentRepositoryApi>(),
        super(const AppointmentListState());

  final AppointmentRepository _repository;

  Future<void> getAppoinments() async {
    emit(state.copyWith(status: StateStatus.loading, exception: null));
    try {
      final AppointmentList result =
          await _repository.getAppointments(data: <String, dynamic>{
        'page': 0,
      });
      emit(state.copyWith(
        status: StateStatus.success,
        appointmentList: result,
        isLoading: false,
        exception: null,
      ));
    } on NetworkException catch (e) {
      emit(state.copyWith(
        status: StateStatus.failure,
        isLoading: false,
        exception: e,
      ));
    }
  }

  Future<void> loadMore() async {
    try {
      final AppointmentList dataOld = state.appointmentList;
      if (dataOld != null && dataOld.pagination.hasMore) {
        emit(state.copyWith(isLoading: true, exception: null));

        final AppointmentList dataNew = await _repository.getAppointments(
          data: <String, dynamic>{
            'page': dataOld.pagination.currentPage + 1,
          },
        );

        emit(state.copyWith(
            status: StateStatus.success,
            appointmentList: dataNew.copyWith(
                appointments: dataOld.appointments + dataNew.appointments),
            isLoading: false,
            exception: null));
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
