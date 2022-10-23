part of 'appointment_list_cubit.dart';

@freezed
class AppointmentListState with _$AppointmentListState {
  const factory AppointmentListState({
    @Default(StateStatus.initial) StateStatus status,
    @Default(AppointmentList()) AppointmentList appointmentList,
    @Default(false) bool isLoading,
    NetworkException? exception,
  }) = _AppointmentListState;
}
