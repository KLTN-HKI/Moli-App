import 'package:moli_app/config/dependency_container.dart';
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
      data: data,
      converter: (_) {},
    );
  }
}
