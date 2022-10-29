class ApiEndpoint {
  const ApiEndpoint._();

  /// Returns the path for an doctor [endpoint].
  static String doctor(DoctorEndpoint endpoint, {int? hospitalId, int? doctorId}) {
    const String path = '/api';
    switch (endpoint) {
      case DoctorEndpoint.doctorByHospitalId:
        assert(
            hospitalId != null, 'hospitalId is required for doctor endpoint');
        return '$path/patient/hospitals/$hospitalId/doctors';
      case DoctorEndpoint.doctorAvailableTime:
        return '$path/appointment/availability-schedule';
      case DoctorEndpoint.allDoctor:
        return '$path/patient/doctors';
      case DoctorEndpoint.doctorById:
        return '$path/patient/doctors/$doctorId';
      case DoctorEndpoint.previewDoctors:
        return '$path/preview/doctors';
      case DoctorEndpoint.previewDoctor:
        return '$path/preview/doctors/$doctorId';
    }
  }
}

enum DoctorEndpoint {
  allDoctor,

  doctorById,

  previewDoctors,
  previewDoctor,
  doctorByHospitalId,

  doctorAvailableTime,
}
