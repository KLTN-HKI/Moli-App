part of 'hospital_cubit.dart';

@freezed
class HospitalState with _$HospitalState {
  const factory HospitalState.initial() = _Initial;

  const factory HospitalState.success({
    required HospitalList hospitals,
    @Default(false) bool isLoading,
  }) = _Success;

  const factory HospitalState.failed(NetworkException exception) = _Failed;
}
