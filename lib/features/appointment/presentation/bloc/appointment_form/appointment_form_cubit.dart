import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/config/config.dart';
import 'package:moli_app/features/appointment/domain/appointment_request.dart';
import 'package:moli_app/shared/shared.dart';

import '../../../data/appointment_repository.dart';
import '../../../data/appointment_repository_api.dart';
import '../../../domain/formz/datetime_picker.dart';

part 'appointment_form_state.dart';
part 'appointment_form_cubit.freezed.dart';

class AppointmentFormCubit extends Cubit<AppointmentFormState> {
  AppointmentFormCubit()
      : _repository = getIt<AppointmentRepositoryApi>(),
        super(const AppointmentFormState.initial());

  final AppointmentRepository _repository;

  void changeAppointmentDate(DateTime? formDate) {
    emit(state.copyWith(
      appointmentDate: DateTimePicker.dirty(formDate),
      exception: null,
      isLoading: false,
      isSucess: false,
    ));
    validDateTime();
  }

  bool validDateTime() {
    final DateTime? formDate = state.appointmentDate.value;
    if (formDate != null) {
      if (formDate.isBefore(DateTime.now())) {
        changeAppointmentDate(null);
        return false;
      }
    }
    return true;
  }

/* 
  void changeCourseId(List<int> course) {
    emit(state.copyWith(
      listAbsence: ListAbsence.dirty(course),
      exception: null,
      isLoading: false,
      isSucess: false,
    ));
  } */

  Future<void> submit() async {
    try {
      final FormzStatus status =
          Formz.validate(<FormzInput<dynamic, bool>>[state.appointmentDate]);

      if (validDateTime() && status.isValid) {
        /* emit(state.copyWith(exception: null, isLoading: true, isSucess: false));

        await _repository.createCourseAbsent(data: <String, dynamic>{
          'from-date': DateTimeUtils.formatDateTime(state.formDate.value),
          'to-date': DateTimeUtils.formatDateTime(state.toDate.value),
          'absent-reason': state.reasonAbsence.value,
          'course-ids': state.isSelectAll ? <int>[] : state.listAbsence.value,
          'select-all': state.isSelectAll,
        });

        emit(state.copyWith(exception: null, isLoading: false, isSucess: true));
      } else {
        emit(state.copyWith(
          formDate: DateTimePicker.dirty(state.formDate.value),
          toDate: DateTimePicker.dirty(state.toDate.value),
          reasonAbsence: ReasonAbsenece.dirty(state.reasonAbsence.value),
          listAbsence: ListAbsence.dirty(state.listAbsence.value),
        )); */
      }
    } on NetworkException catch (e) {
      emit(state.copyWith(
        exception: e,
        isLoading: false,
        isSucess: false,
      ));
    }
  }
}
