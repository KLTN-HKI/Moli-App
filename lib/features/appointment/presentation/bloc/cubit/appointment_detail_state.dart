part of 'appointment_detail_cubit.dart';

@freezed
class AppointmentDetailState with _$AppointmentDetailState {
  const factory AppointmentDetailState.initial({
    @Default(Appointment(id: 0))
        Appointment appointment,
    @Default(false) bool isLoading,
    NetworkException? exception,
  }) = _Initial;
}
