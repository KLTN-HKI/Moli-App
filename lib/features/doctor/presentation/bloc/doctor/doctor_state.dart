part of 'doctor_bloc.dart';

@freezed
class DoctorState with _$DoctorState {
  const factory DoctorState.initial() = _Initial;
  const factory DoctorState.success({
    required DoctorList doctors,
    @Default(false) bool isLoading,
  }) = _Success;
  const factory DoctorState.failed(NetworkException exception) = _Failed;
}
