import 'package:moli_app/shared/shared.dart';

import '../domain/hospital.dart';
import 'hospital_repository.dart';

class HospitalRepositoryLocal implements HospitalRepository {
  const HospitalRepositoryLocal._();

  static KeyValueStorageBase? _storage;

  /*  static Future<CourseRepositoryLocal> create() async {
    Hive.registerAdapter<CourseHive>(CourseHiveAdapter());

    await Hive.openBox<CourseHive>('CourseHive');

    _storage ??= KeyValueStorageBase.instance;

    return const CourseRepositoryLocal._();
  } */

  @override
  Future<HospitalList> fetchHospitalList({required JSON data}) {
    throw UnimplementedError();
  }
}
