import 'package:moli_app/config/dependency_container.dart';
import 'package:moli_app/features/appointment/domain/appointment.dart';
import 'package:moli_shared/moli_shared.dart';

import '../domain/patient_state.dart';
import 'appointment_endpoint.dart';
import 'appointment_repository.dart';

class AppointmentRepositoryApi implements AppointmentRepository {
  AppointmentRepositoryApi() : _apiService = getIt();
  final ApiService _apiService;

  @override
  Future<CreateAppointmentResult> bookDoctor({required JSON data}) {
    return _apiService.setData(
      endpoint: ApiEndpoint.appointment(AppointmentEndpoint.bookingAppointment),
      requiresAuthToken: true,
      data: data,
      converter: (JSON response) =>
          CreateAppointmentResult.fromJson(response['data'] as JSON),
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

  @override
  Future<PatientStateResult> getUserState() {
    return _apiService.getDocumentData(
        endpoint: ApiEndpoint.appointment(AppointmentEndpoint.state),
        requiresAuthToken: true,
        converter: (JSON response) {
          return PatientStateResult.fromJson(response['data'] as JSON);
        });
  }

  @override
  Future<void> ratingAppointment({required JSON data}) {
    return _apiService.setData(
      endpoint: ApiEndpoint.appointment(AppointmentEndpoint.ratingAppointment),
      data: data,
      converter: (_) {},
    );
  }
}
