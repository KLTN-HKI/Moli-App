import 'package:moli_app/config/dependency_container.dart';
import 'package:moli_app/features/appointment/domain/appointment.dart';
import 'package:moli_shared/moli_shared.dart';

import 'appointment_endpoint.dart';
import 'appointment_repository.dart';

class AppointmentRepositoryApi implements AppointmentRepository {
  AppointmentRepositoryApi() : _apiService = getIt();
  final ApiService _apiService;

  @override
  Future<void> bookDoctor({required JSON data}) {
    return _apiService.setData(
      endpoint: ApiEndpoint.appointment(AppointmentEndpoint.bookingAppointment),
      requiresAuthToken: true,
      data: data,
      converter: (_) {},
    );
  }

  @override
  Future<AppointmentList> getAppointments({required JSON data}) {
    return _apiService.getDocumentData(
      endpoint: ApiEndpoint.appointment(AppointmentEndpoint.manageAppointment),
      queryParams: data,
      converter: AppointmentList.fromJson,
    );
  }

  @override
  Future<Appointment> updateAppointmentStatus(
      {required JSON data, String? appointmentId}) {
    return _apiService.updateData(
      endpoint: ApiEndpoint.appointment(
        AppointmentEndpoint.updateAppointmentStatus,
        id: appointmentId,
      ),
      data: data,
      converter: (JSON responseBody) =>
          Appointment.fromJson(responseBody['data'] as JSON),
    );
  }

  @override
  Future<Appointment> getAppointment({required JSON data, required String id}) {
    return _apiService.getDocumentData(
      endpoint: ApiEndpoint.appointment(
        AppointmentEndpoint.detailAppointment,
        id: id,
      ),
      queryParams: data,
      converter: (JSON responseBody) =>
          Appointment.fromJson(responseBody['data'] as JSON),
    );
  }
}
