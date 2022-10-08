import 'package:moli_app/features/appointment/data/appointment_repository.dart';
import 'package:moli_app/features/appointment/domain/appointment.dart';
import 'package:moli_app/shared/common/other/typedefs.dart';

class AppointmentRepositoryLocal implements AppointmentRepository {
  @override
  Future<void> bookDoctor({required JSON data}) {
    throw UnimplementedError();
  }

  @override
  Future<AppointmentList> getAppointments({required JSON data}) {
    throw UnimplementedError();
  }
}
