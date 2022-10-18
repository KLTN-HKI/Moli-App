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
        super(const AppointmentState.initial());

  final AppointmentRepository _repository;

  Future<void> fetchAppointmentByUuid(String appointmentUuId) async {
    emit(const AppointmentState.initial(isLoading: true));
    try {
      final Appointment result = await _repository.getAppointment(
        id: appointmentUuId,
        data: <String, dynamic>{},
      );

      emit(AppointmentState.initial(appointment: result, isLoading: false));
    } on NetworkException catch (e) {
      emit(AppointmentState.initial(exception: e));
    }
  }

  Future<void> updateAppointment(
      String appointmentUuid, AppointmentUpdateRequest request) async {
    try {
      emit(
        state.copyWith(
          exception: null,
          isLoading: true,
          isSucess: false,
        ),
      );
      final Appointment result = await _repository.updateAppointmentStatus(
        data: <String, dynamic>{
          'appointmentStatus': request.appointmentStatus.status,
          'reason': request.reason,
        },
        appointmentId: appointmentUuid,
      );
      emit(
        state.copyWith(
          appointment: result,
          exception: null,
          isLoading: false,
          isSucess: true,
        ),
      );
    } on NetworkException catch (e) {
      emit(state.copyWith(
        exception: e,
        isLoading: false,
        isSucess: false,
      ));
    }
  }
}
