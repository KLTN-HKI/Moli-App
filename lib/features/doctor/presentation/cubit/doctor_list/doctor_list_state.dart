part of 'doctor_list_cubit.dart';

@freezed
class DoctorListState with _$DoctorListState {
  const factory DoctorListState({
    @Default(StateStatus.initial) StateStatus status,
    @Default(DoctorList()) DoctorList doctors,
    @Default(false) bool isLoading,
    String? term,
    NetworkException? exception,
  }) = _DoctorListState;
}
