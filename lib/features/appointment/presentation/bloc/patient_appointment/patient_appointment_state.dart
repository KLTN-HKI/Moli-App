part of 'patient_appointment_bloc.dart';

@freezed
class PatientAppointmentState with _$PatientAppointmentState {
  const factory PatientAppointmentState({
    @Default(PatientStateResult()) PatientStateResult patientState,
    NetworkException? exception,
  }) = _PatientAppointmentState;
}
