import 'package:moli_app/features/appointment/data/appointment_repository.dart';
import 'package:moli_app/features/appointment/domain/appointment.dart';
import 'package:moli_shared/moli_shared.dart';

class AppointmentRepositoryLocal implements AppointmentRepository {
  @override
  Future<void> bookDoctor({required JSON data}) {
    throw UnimplementedError();
  }

  @override
  Future<AppointmentList> getAppointments({required JSON data}) {
    throw UnimplementedError();
  }

  @override
  Future<Appointment> updateAppointmentStatus(
      {required JSON data, String? appointmentId}) {
    throw UnimplementedError();
  }

  @override
  Future<Appointment> getAppointment({required JSON data, required String id}) {
    throw UnimplementedError();
  }
}
