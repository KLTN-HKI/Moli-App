import 'package:moli_app/shared/shared.dart';

import '../domain/hospital.dart';

abstract class HospitalRepository {
  /// Get course list
  Future<HospitalList> fetchHospitalList({required JSON data});
}
