import 'package:moli_app/features/doctor/domain/doctor.dart';
import 'package:moli_app/features/doctor/domain/schedule.dart';
import 'package:moli_shared/moli_shared.dart';

abstract class DoctorRepository {
  /// Get doctos list by [hospitalId]
  Future<DoctorList> fetchDoctorsByHospitalId(
      {required JSON data, required int hospitalId});

  Future<DoctorAvailableTime> fetchDoctorsSchedule({required JSON data});
}
