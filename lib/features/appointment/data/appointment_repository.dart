import 'package:moli_app/features/appointment/domain/appointment.dart';
import 'package:moli_shared/moli_shared.dart';

abstract class AppointmentRepository {
  Future<void> bookDoctor({required JSON data});
  Future<Appointment> getAppointment({required JSON data, required String id});
  Future<AppointmentList> getAppointments({required JSON data});
  Future<Appointment> updateAppointmentStatus(
      {required JSON data, String? appointmentId});
}
