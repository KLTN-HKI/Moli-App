import 'package:moli_shared/moli_shared.dart';

import '../domain/hospital.dart';

abstract class HospitalRepository {
  /// Get course list
  Future<HospitalList> fetchHospitalList({required JSON data});
}
