import 'package:freezed_annotation/freezed_annotation.dart';

import 'appointment.dart';

part 'appointment_update.freezed.dart';
part 'appointment_update.g.dart';

@freezed
class AppointmentUpdateRequest with _$AppointmentUpdateRequest {
  const factory AppointmentUpdateRequest({
    @JsonKey() required AppointmentStatus appointmentStatus,
    @JsonKey() String? reason,
    @JsonKey() int? doctorScheduleId,
  }) = _AppointmentUpdateRequest;

  factory AppointmentUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$AppointmentUpdateRequestFromJson(json);
}
