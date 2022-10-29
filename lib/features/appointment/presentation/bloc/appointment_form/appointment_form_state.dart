part of 'appointment_form_cubit.dart';

@freezed
class AppointmentFormState with _$AppointmentFormState {
  const factory AppointmentFormState({
    // AppointmentRequest? appointmentRequest,
    // @Default(Email.pure()) Email email,
    // @Default(DateTimePicker.pure()) DateTimePicker appointmentDate,
    // @Default(Description.pure()) Description describeSymptoms,
    @Default(AppointmentForm()) AppointmentForm patientForm,
    @Default(0) int doctorId,
    @Default(0) int doctorScheduleId,
    @Default(true) bool forSelf,
    Appointment? appointment,
    @Default(false) bool isLoading,
    @Default(false) bool isSucess,
    NetworkException? exception,
  }) = _AppointmentFormState;
}
