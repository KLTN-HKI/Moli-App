import 'package:moli_app/features/appointment/domain/appointment.dart';
import 'package:moli_shared/moli_shared.dart';

import '../domain/patient_state.dart';

abstract class AppointmentRepository {
  Future<CreateAppointmentResult> bookDoctor({required JSON data});
  Future<Appointment> getAppointment({required JSON data, required String id});
  Future<AppointmentList> getAppointments({required JSON data});
  Future<Appointment> updateAppointmentStatus(
      {required JSON data, String? appointmentId});
  Future<PatientStateResult> getUserState();
  Future<void> ratingAppointment({required JSON data});
}
