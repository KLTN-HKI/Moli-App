import 'package:moli_app/config/config.dart';
import 'package:moli_app/features/doctor/data/doctor_endpoint.dart';
import 'package:moli_app/features/doctor/domain/doctor.dart';
import 'package:moli_app/shared/shared.dart';

import 'doctor_repository.dart';

class DoctorRepositoryApi implements DoctorRepository {
  DoctorRepositoryApi() : _apiService = getIt();

  final ApiService _apiService;

  @override
  Future<DoctorList> fetchDoctorsByHospitalId(
      {required JSON data, required int hospitalId}) {
    return _apiService.getDocumentData<DoctorList>(
      endpoint: ApiEndpoint.doctor(
        DoctorEndpoint.byHospitalId,
        hospitalId: hospitalId,
      ),
      converter: DoctorList.fromJson,
    );
  }
}
