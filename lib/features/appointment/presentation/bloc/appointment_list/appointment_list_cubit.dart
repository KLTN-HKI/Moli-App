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
        super(const AppointmentListState.initial());

  final AppointmentRepository _repository;

  Future<void> getAppoinments() async {
    try {
      final AppointmentList result =
          await _repository.getAppointments(data: <String, dynamic>{
        'page': 0,
        'size': 25,
      });
      emit(AppointmentListState.success(appointmentList: result));
    } on NetworkException catch (e) {
      emit(AppointmentListState.failed(e));
    }
  }

  Future<void> loadMore() async {
    try {
      final AppointmentList? dataOld = state.whenOrNull(
          success: (AppointmentList appointmentList, _) => appointmentList);
      if (dataOld != null && dataOld.pagination.hasMore) {
        emit(AppointmentListState.success(
            appointmentList: dataOld, isLoading: true));

        final AppointmentList dataNew = await _repository.getAppointments(
          data: <String, dynamic>{
            'size': 10,
            'page': dataOld.pagination.currentPage + 1,
          },
        );

        emit(AppointmentListState.success(
          appointmentList: dataNew.copyWith(
              appointments: dataOld.appointments + dataNew.appointments),
          isLoading: false,
        ));
      }
    } on NetworkException catch (e) {
      emit(AppointmentListState.failed(e));
    }
  }
}
