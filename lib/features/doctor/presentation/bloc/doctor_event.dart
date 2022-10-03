part of 'doctor_bloc.dart';

@freezed
class DoctorEvent with _$DoctorEvent {
  const factory DoctorEvent.started() = _Started;
  const factory DoctorEvent.fetchDoctorsByHospitalId(
      {required int hospitalId, int? page}) = _FetchDoctorsByHospitalId;
}