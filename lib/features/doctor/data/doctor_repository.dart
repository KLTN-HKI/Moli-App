import 'package:moli_app/features/doctor/domain/doctor.dart';
import 'package:moli_app/shared/shared.dart';

abstract class DoctorRepository {
  /// Get doctos list by [hospitalId]
  Future<DoctorList> fetchDoctorsByHospitalId(
      {required JSON data, required int hospitalId});
}
