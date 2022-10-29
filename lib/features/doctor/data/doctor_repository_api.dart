import 'package:moli_app/config/config.dart';
import 'package:moli_app/features/doctor/data/doctor_endpoint.dart';
import 'package:moli_app/features/doctor/domain/doctor.dart';
import 'package:moli_app/features/doctor/domain/schedule.dart';
import 'package:moli_shared/moli_shared.dart';

import 'doctor_repository.dart';

class DoctorRepositoryApi implements DoctorRepository {
  DoctorRepositoryApi() : _apiService = getIt();

  final ApiService _apiService;

  @override
  Future<DoctorList> fetchDoctorsByHospitalId(
      {required JSON data, required int hospitalId}) {
    return _apiService.getDocumentData<DoctorList>(
      endpoint: ApiEndpoint.doctor(
        DoctorEndpoint.doctorByHospitalId,
        hospitalId: hospitalId,
      ),
      converter: DoctorList.fromJson,
    );
  }

  @override
  Future<DoctorAvailableTime> fetchDoctorsSchedule({required JSON data}) {
    return _apiService.getDocumentData<DoctorAvailableTime>(
      endpoint: ApiEndpoint.doctor(
        DoctorEndpoint.doctorAvailableTime,
      ),
      queryParams: data,
      converter: DoctorAvailableTime.fromJson,
    );
  }

  @override
  Future<DoctorList> fetchAllDoctor({required JSON data}) {
    return _apiService.getDocumentData<DoctorList>(
      endpoint: ApiEndpoint.doctor(DoctorEndpoint.allDoctor),
      queryParams: <String, dynamic>{
        'size': 10,
        ...data,
      },
      converter: DoctorList.fromJson,
    );
  }

  @override
  Future<Doctor> fetchDoctorById({required int doctorId}) {
    return _apiService.getDocumentData<Doctor>(
      endpoint:
          ApiEndpoint.doctor(DoctorEndpoint.doctorById, doctorId: doctorId),
      converter: (JSON responseBody) =>
          Doctor.fromJson(responseBody['data'] as JSON),
    );
  }
}
