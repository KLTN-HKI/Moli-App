part of 'hospital_list_cubit.dart';

@freezed
class HospitalListState with _$HospitalListState {
  const factory HospitalListState({
    @Default(StateStatus.initial) StateStatus status,
    @Default(HospitalList()) HospitalList hospitals,
    @Default(false) bool isLoading,
    String? term,
    NetworkException? exception,
  }) = _HospitalListState;
}
