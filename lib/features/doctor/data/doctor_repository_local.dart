import 'package:moli_app/features/doctor/domain/doctor.dart';
import 'package:moli_app/features/doctor/domain/schedule.dart';
import 'package:moli_app/shared/shared.dart';

import 'doctor_repository.dart';

class DoctorRepositoryLocal implements DoctorRepository {
  const DoctorRepositoryLocal._();

  @override
  Future<DoctorList> fetchDoctorsByHospitalId(
      {required JSON data, required int hospitalId}) {
    throw UnimplementedError();
  }

  @override
  Future<DoctorAvailableTime> fetchDoctorsSchedule({required JSON data}) {
    throw UnimplementedError();
  }
}
