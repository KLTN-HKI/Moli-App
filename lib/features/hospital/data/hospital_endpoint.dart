class ApiEndpoint {
  const ApiEndpoint._();

  /// Returns the path for an course [endpoint].
  static String hospital(HospitalEndpoint endpoint, {int? id}) {
    const String path = '/api';
    switch (endpoint) {
      case HospitalEndpoint.all:
        return '$path/patient/hospitals';
      case HospitalEndpoint.detail:
        return '$path/patient/hospitals/$id';
    }
  }
}

enum HospitalEndpoint {
  all,
  detail,
}
