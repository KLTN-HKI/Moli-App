import 'package:moli_app/features/doctor/domain/doctor.dart';
import 'package:moli_app/shared/shared.dart';

import 'doctor_repository.dart';

class DoctorRepositoryLocal implements DoctorRepository {
  const DoctorRepositoryLocal._();

  @override
  Future<DoctorList> fetchDoctorsByHospitalId(
      {required JSON data, required int hospitalId}) {
    throw UnimplementedError();
  }
}
