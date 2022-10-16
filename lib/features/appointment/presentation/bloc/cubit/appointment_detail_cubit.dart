import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/config/config.dart';
import 'package:moli_app/features/appointment/data/appointment_repository.dart';
import 'package:moli_app/features/appointment/data/appointment_repository_api.dart';
import 'package:moli_app/features/appointment/domain/appointment.dart';
import 'package:moli_shared/moli_shared.dart';

part 'appointment_detail_state.dart';
part 'appointment_detail_cubit.freezed.dart';

class AppointmentDetailCubit extends Cubit<AppointmentDetailState> {
  AppointmentDetailCubit(this.appointmentUuId)
      : _repository = getIt<AppointmentRepositoryApi>(),
        super(const AppointmentDetailState.initial());

  final AppointmentRepository _repository;
  final String appointmentUuId;

  Future<void> fetchAppointmentByUuid() async {
    emit(const AppointmentDetailState.initial(isLoading: true));
    try {
      final Appointment result = await _repository.getAppointment(
        id: appointmentUuId,
        data: <String, dynamic>{},
      );

      emit(AppointmentDetailState.initial(
          appointment: result, isLoading: false));
    } on NetworkException catch (e) {
      emit(AppointmentDetailState.initial(exception: e));
    }
  }
}
