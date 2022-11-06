class ApiEndpoint {
  const ApiEndpoint._();

  /// Returns the path for an course [endpoint].
  static String appointment(AppointmentEndpoint endpoint, {String? id}) {
    const String path = '/api';
    switch (endpoint) {
      case AppointmentEndpoint.detailAppointment:
        return '$path/appointment/$id';
      case AppointmentEndpoint.bookingAppointment:
        return '$path/appointment/booking-appointment';
      case AppointmentEndpoint.manageAppointment:
        return '$path/appointment/patient/manage-appointment';
      case AppointmentEndpoint.updateAppointmentStatus:
        return '$path/appointment/$id/update-status?forRole=ROLE_DOCTOR';
      case AppointmentEndpoint.state:
        return '$path/patient/state';
      case AppointmentEndpoint.ratingAppointment:
        return '$path/rating/save-rating';
    }
  }
}

enum AppointmentEndpoint {
  detailAppointment,

  bookingAppointment,

  manageAppointment,

  updateAppointmentStatus,

  ratingAppointment,
  state,
}
