part of 'doctor_cubit.dart';

@freezed
class DoctorState with _$DoctorState {
  const factory DoctorState({
    @Default(StateStatus.initial) StateStatus status,
    @Default(Doctor(id: 0)) Doctor doctor,
    @Default(false) bool isLoading,
    NetworkException? exception,
  }) = _DoctorState;
}
