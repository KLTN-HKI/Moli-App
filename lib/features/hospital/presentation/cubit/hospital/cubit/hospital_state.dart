part of 'hospital_cubit.dart';

@freezed
class HospitalState with _$HospitalState {
  const factory HospitalState({
     @Default(StateStatus.initial) StateStatus status,
    @Default(Hospital(id: 0)) Hospital hospital,
    @Default(false) bool isLoading,
    NetworkException? exception,
  }) = _HospitalState;
}
