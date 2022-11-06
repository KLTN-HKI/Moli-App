import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/config/dependency_container.dart';
import 'package:moli_app/features/appointment/presentation/bloc/patient_appointment/patient_appointment_bloc.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../../../data/appointment_repository.dart';
import '../../../../data/appointment_repository_api.dart';
import '../../../../domain/formz/comment.dart';

part 'appointment_rating_state.dart';
part 'appointment_rating_cubit.freezed.dart';

class AppointmentRatingCubit extends Cubit<AppointmentRatingState> {
  AppointmentRatingCubit(this.appointmentUuid)
      : statebloc = getIt(),
        _repository = getIt<AppointmentRepositoryApi>(),
        super(const AppointmentRatingState());

  final AppointmentRepository _repository;
  final PatientAppointmentBloc statebloc;
  final String appointmentUuid;

  Future<void> ratingAppointment() async {
    try {
      emit(state.copyWith(status: StateStatus.loading));

      await _repository.ratingAppointment(data: <String, dynamic>{
        'appointmentUuid': appointmentUuid,
        'comment': state.comment.value,
        'score': state.rating,
        'skipped': false,
      });
      emit(state.copyWith(status: StateStatus.success));

      // statebloc.state.
    } on NetworkException catch (e) {
      emit(
        state.copyWith(
          status: StateStatus.failure,
          exception: e,
        ),
      );
    }
  }

  Future<void> skipRatingAppointment() async {
    try {
      emit(state.copyWith(status: StateStatus.loading));

      await _repository.ratingAppointment(data: <String, dynamic>{
        'appointmentUuid': appointmentUuid,
        'skipped': true,
      });
      emit(state.copyWith(status: StateStatus.updated));
    } on NetworkException catch (e) {
      emit(
        state.copyWith(
          status: StateStatus.failure,
          exception: e,
        ),
      );
    }
  }

  void commentChanged(String value) {
    final Comment reason = Comment.dirty(value);
    emit(state.copyWith(
        status: StateStatus.initial, comment: reason, exception: null));
  }

  void ratingChanged(double value) {
    emit(state.copyWith(
        status: StateStatus.initial, rating: value, exception: null));
  }
}
