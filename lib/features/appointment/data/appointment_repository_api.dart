import 'package:moli_app/config/dependency_container.dart';
import 'package:moli_app/features/appointment/domain/appointment.dart';
import 'package:moli_app/shared/shared.dart';

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
      requiresAuthToken: true,
      queryParams: data,
      converter: AppointmentList.fromJson,
    );
  }
}
