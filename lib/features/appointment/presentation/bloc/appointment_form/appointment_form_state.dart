part of 'appointment_form_cubit.dart';

@freezed
class AppointmentFormState with _$AppointmentFormState {
  const factory AppointmentFormState.initial({
    @Default(DateTimePicker.pure()) DateTimePicker appointmentDate,
    AppointmentRequest? appointment,
    @Default(false) bool isLoading,
    @Default(false) bool isSucess,
    NetworkException? exception,
  }) = _Initial;
}
