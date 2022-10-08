import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/config/dependency_container.dart';
import 'package:moli_app/features/appointment/data/appointment_repository.dart';
import 'package:moli_app/features/appointment/data/appointment_repository_api.dart';
import 'package:moli_app/shared/shared.dart';

part 'appointment_state.dart';
part 'appointment_cubit.freezed.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit()
      : _repository = getIt<AppointmentRepositoryApi>(),
        super(const AppointmentState.initial());

  final AppointmentRepository _repository;

  Future<void> bookDoctor() async {
    try {
      emit(state.copyWith(exception: null, isLoading: true, isSucess: false));
      await _repository.bookDoctor(data: <String, dynamic>{
        '': '',
      });
    } on NetworkException catch (e) {
      emit(state.copyWith(
        exception: e,
        isLoading: false,
        isSucess: false,
      ));
    }
  }

  Future<void> cancelAppointment(String appointmentId) async {
    try {
      emit(
        state.copyWith(
          exception: null,
          isLoading: true,
          isSucess: false,
        ),
      );
      await _repository.cancelAppointment(
        data: <String, dynamic>{},
        appointmentId: appointmentId,
      );
      emit(
        state.copyWith(
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
