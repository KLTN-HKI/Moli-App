part of 'appointment_cubit.dart';

@freezed
class AppointmentState with _$AppointmentState {
  const factory AppointmentState({
    @Default(StateStatus.initial) StateStatus status,
    @Default(Appointment(id: 0)) Appointment appointment,
    @Default(false) bool isLoading,
    NetworkException? exception,
  }) = _AppointmentState;
}
