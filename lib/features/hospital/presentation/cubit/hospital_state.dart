part of 'hospital_cubit.dart';

@freezed
class HospitalState with _$HospitalState {
  const factory HospitalState({
    @Default(StateStatus.initial) StateStatus status,
    @Default(HospitalList()) HospitalList hospitals,
    @Default(false) bool isLoading,
    String? term,
    NetworkException? exception,
  }) = _HospitalState;
}
