import 'package:moli_app/config/config.dart';
import 'package:moli_shared/moli_shared.dart';

import '../domain/hospital.dart';
import 'hospital_endpoint.dart';
import 'hospital_repository.dart';

class HospitalRepositoryApi implements HospitalRepository {
  HospitalRepositoryApi() : _apiService = getIt();

  final ApiService _apiService;

  @override
  Future<HospitalList> fetchHospitalList({required JSON data}) {
    return _apiService.getDocumentData<HospitalList>(
      endpoint: ApiEndpoint.hospital(HospitalEndpoint.all),
      queryParams: <String, dynamic>{
        'size': 10,
        ...data,
      },
      converter: HospitalList.fromJson,
    );
  }

  @override
  Future<Hospital> fetchHospitalByid({required int hospitalId}) {
    return _apiService.getDocumentData<Hospital>(
      endpoint: ApiEndpoint.hospital(HospitalEndpoint.detail, id: hospitalId),
      converter: (JSON responseBody) =>
          Hospital.fromJson(responseBody['data'] as JSON),
    );
  }
}
