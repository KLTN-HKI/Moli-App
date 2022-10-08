class ApiEndpoint {
  const ApiEndpoint._();

  /// Returns the path for an course [endpoint].
  static String appointment(AppointmentEndpoint endpoint, {String? id}) {
    const String path = '/api';
    switch (endpoint) {
      case AppointmentEndpoint.bookingAppointment:
        return '$path/appointment/booking-appointment';
      case AppointmentEndpoint.manageAppointment:
        return '$path/appointment/patient/manage-appointment';
      case AppointmentEndpoint.cancelAppointment:
        return '$path/appointment/patient/$id/cancel';
    }
  }
}

enum AppointmentEndpoint {
  bookingAppointment,

  manageAppointment,

  cancelAppointment,
}
