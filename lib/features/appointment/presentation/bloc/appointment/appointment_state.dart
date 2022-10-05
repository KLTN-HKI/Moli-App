part of 'appointment_cubit.dart';

@freezed
class AppointmentState with _$AppointmentState {
  const factory AppointmentState.initial({
    @Default(false) bool isLoading,
    @Default(false) bool isSucess,
    NetworkException? exception,
  }) = _Initial;
}
