import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/config/dependency_container.dart';
import 'package:moli_app/features/appointment/data/appointment_repository.dart';
import 'package:moli_app/features/appointment/data/appointment_repository_api.dart';
import 'package:moli_app/features/appointment/domain/appointment_update.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../../domain/appointment.dart';

part 'appointment_state.dart';
part 'appointment_cubit.freezed.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit()
      : _repository = getIt<AppointmentRepositoryApi>(),
        super(const AppointmentState());

  final AppointmentRepository _repository;

  Future<void> getAppointmentByUuid(String appointmentUuId) async {
    emit(state.copyWith(status: StateStatus.loading));
    try {
      final Appointment result = await _repository.getAppointment(
        id: appointmentUuId,
        data: <String, dynamic>{},
      );
      emit(state.copyWith(
          status: StateStatus.success,
          appointment: result,
          isLoading: false,
          exception: null));
    } on NetworkException catch (e) {
      emit(state.copyWith(
          status: StateStatus.failure, isLoading: false, exception: e));
    }
  }

  Future<void> updateAppointment(
      String appointmentUuid, AppointmentUpdateRequest request) async {
    try {
      emit(state.copyWith(exception: null, isLoading: true));
      final Appointment result = await _repository.updateAppointmentStatus(
        appointmentId: appointmentUuid,
        data: <String, dynamic>{
          'appointmentStatus': request.appointmentStatus.status,
          'reason': request.reason,
        },
      );
      emit(state.copyWith(
        status: StateStatus.updated,
        appointment: result,
        exception: null,
        isLoading: false,
      ));
    } on NetworkException catch (e) {
      emit(state.copyWith(
        status: StateStatus.failure,
        exception: e,
        isLoading: false,
      ));
    }
  }
}
