class ApiEndpoint {
  const ApiEndpoint._();

  /// Returns the path for an doctor [endpoint].
  static String doctor(DoctorEndpoint endpoint, {int? hospitalId}) {
    const String path = '/api';
    switch (endpoint) {
      case DoctorEndpoint.byHospitalId:
        assert(
            hospitalId != null, 'hospitalId is required for doctor endpoint');
        return '$path/patient/hospitals/$hospitalId/doctors';
    }
  }
}

enum DoctorEndpoint {
  byHospitalId,
}
