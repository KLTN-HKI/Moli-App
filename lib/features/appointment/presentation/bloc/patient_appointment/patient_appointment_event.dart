part of 'patient_appointment_bloc.dart';

@freezed
class PatientAppointmentEvent with _$PatientAppointmentEvent {
  const factory PatientAppointmentEvent.started() = _Started;
  const factory PatientAppointmentEvent.updated(PatientStateResult patientState) = _Updated;
}
