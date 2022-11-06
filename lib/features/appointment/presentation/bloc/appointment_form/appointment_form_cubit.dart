import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/config/config.dart';
import 'package:moli_app/features/appointment/domain/appointment.dart';
import 'package:moli_app/features/appointment/domain/formz/apointment_form.dart';
import 'package:moli_app/features/appointment/domain/formz/description.dart';
import 'package:moli_app/features/appointment/domain/formz/name.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../../../authentication/domain/response/user_model.dart';
import '../../../data/appointment_repository.dart';
import '../../../data/appointment_repository_api.dart';
import '../../../domain/formz/datetime_picker.dart';
import '../../../domain/formz/email.dart';
import '../../../domain/formz/phone_number.dart';

part 'appointment_form_state.dart';
part 'appointment_form_cubit.freezed.dart';

class AppointmentFormCubit extends Cubit<AppointmentFormState> {
  AppointmentFormCubit()
      : _repository = getIt<AppointmentRepositoryApi>(),
        super(const AppointmentFormState());

  final AppointmentRepository _repository;

  void changeAppointmentDate(DateTime? formDate) {
    emit(state.copyWith(
      patientForm: state.patientForm
          .copyWith(appointmentDate: DateTimePicker.dirty(formDate)),
      exception: null,
      isSucess: false,
    ));
    validDateTime();
  }

  void phoneNumberChanged(String value) {
    final PhoneNumber phoneNumber = PhoneNumber.dirty(value);
    emit(
      state.copyWith(
        patientForm:
            state.patientForm.copyWith(patientRealPhoneNumber: phoneNumber),
        exception: null,
        isSucess: false,
      ),
    );
  }

  void nameChanged(String value) {
    final Name patientName = Name.dirty(value);
    emit(
      state.copyWith(
        patientForm: state.patientForm.copyWith(patientName: patientName),
        exception: null,
        isSucess: false,
      ),
    );
  }

  void emailChanged(String value) {
    final Email patientEmail = Email.dirty(value);
    emit(
      state.copyWith(
        patientForm: state.patientForm.copyWith(emailPatient: patientEmail),
        exception: null,
        isSucess: false,
      ),
    );
  }

  void descriptionChanged(String value) {
    final Description description = Description.dirty(value);
    emit(
      state.copyWith(
        patientForm: state.patientForm.copyWith(description: description),
        exception: null,
        isSucess: false,
      ),
    );
  }

  bool validDateTime() {
    final DateTime? formDate = state.patientForm.appointmentDate.value;
    if (formDate != null) {
      // if (formDate.isBefore(DateTime.now())) {
      //   changeAppointmentDate(null);
      //   return false;
      // }
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

  Future<void> submit({
    required int doctorId,
    required int doctorScheduleId,
    required int hospitalId,
    required Gender gender,
    required bool forSelf,
    UserModel? currentUser,
  }) async {
    try {
      emit(state.copyWith(exception: null, isLoading: true, isSucess: false));
      if (forSelf && currentUser != null) {
        final CreateAppointmentResult appointment =
            await _repository.bookDoctor(data: <String, dynamic>{
          'describeSymptoms': state.patientForm.description.value,
          'doctorId': doctorId,
          'doctorScheduleId': doctorScheduleId,
          'emailPatient': currentUser.email,
          'forSelf': forSelf,
          'genderPatient': currentUser.gender?.gender,
          'hospitalId': hospitalId,
          'patientId': currentUser.id,
          'patientName': currentUser.name,
          'patientRealPhoneNumber': currentUser.realPhoneNumber,
        });
        emit(state.copyWith(
          exception: null,
          appointment: appointment,
          isLoading: false,
          isSucess: true,
        ));
      } else {
        final FormzStatus status = Formz.validate(state.patientForm.inputs);
        if (validDateTime() && status.isValid && !forSelf) {
          final CreateAppointmentResult appointment =
              await _repository.bookDoctor(data: <String, dynamic>{
            'describeSymptoms': state.patientForm.description.value,
            'doctorId': doctorId,
            'doctorScheduleId': doctorScheduleId,
            'emailPatient': state.patientForm.emailPatient.value,
            'forSelf': forSelf,
            'genderPatient': gender.gender,
            'hospitalId': hospitalId,
            'patientName': state.patientForm.patientName.value,
            'patientRealPhoneNumber':
                state.patientForm.patientRealPhoneNumber.value,
          });

          emit(state.copyWith(
            exception: null,
            appointment: appointment,
            isLoading: false,
            isSucess: true,
          ));
        } else {}
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
