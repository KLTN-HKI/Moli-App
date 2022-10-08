import 'package:moli_app/features/appointment/domain/appointment.dart';
import 'package:moli_app/shared/shared.dart';

abstract class AppointmentRepository {
  Future<void> bookDoctor({required JSON data});
  Future<AppointmentList> getAppointments({required JSON data});
  Future<void> cancelAppointment({required JSON data, String? appointmentId});
}
