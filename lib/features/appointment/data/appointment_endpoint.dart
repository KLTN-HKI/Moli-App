class ApiEndpoint {
  const ApiEndpoint._();

  /// Returns the path for an course [endpoint].
  static String appointment(AppointmentEndpoint endpoint, {int? id}) {
    const String path = '/api';
    switch (endpoint) {
      case AppointmentEndpoint.bookingAppointment:
        return '$path/appointment/booking-appointment';
      case AppointmentEndpoint.manageAppointment:
        return '$path/appointment/patient/manage-appointment';
    }
  }
}

enum AppointmentEndpoint {
  bookingAppointment,

  manageAppointment
}
