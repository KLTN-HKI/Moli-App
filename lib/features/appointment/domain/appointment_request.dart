import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment_request.freezed.dart';
part 'appointment_request.g.dart';

@freezed
class AppointmentRequest with _$AppointmentRequest {
  const factory AppointmentRequest({
    @JsonKey() String? describeSymptoms,
    @JsonKey() required int doctorId,
    @JsonKey() required int doctorScheduleId,
    @JsonKey() String? emailPatient,
    @JsonKey() @Default(true) bool forSelf,
    @JsonKey() String? genderPatient,
    @JsonKey() int? hospitalId,
    @JsonKey() required int patientId,
    @JsonKey() String? patientName,
    @JsonKey() String? patientRealPhoneNumber,
  }) = _AppointmentRequest;

  factory AppointmentRequest.fromJson(Map<String, dynamic> json) =>
      _$AppointmentRequestFromJson(json);
}
