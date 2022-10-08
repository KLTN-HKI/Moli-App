import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/features/authentication/domain/response/response.dart';
import 'package:moli_app/features/doctor/domain/doctor.dart';
import 'package:moli_app/features/hospital/domain/hospital.dart';
import 'package:moli_app/shared/shared.dart';

part 'appointment.freezed.dart';
part 'appointment.g.dart';

@freezed
class AppointmentList with _$AppointmentList {
  const factory AppointmentList({
    @JsonKey() @Default(<Appointment>[]) List<Appointment> appointments,
    @JsonKey() @Default(Pagination()) Pagination pagination,
  }) = _AppointmentList;

  factory AppointmentList.fromJson(Map<String, dynamic> json) =>
      _$AppointmentListFromJson(json);
}

@freezed
class Appointment with _$Appointment {
  const factory Appointment({
    @JsonKey()
        required int id,
    @JsonKey()
        String? appointmentCode,
    @JsonKey()
        String? appointmentUuid,
    @JsonKey()
        Hospital? hospital,
    @JsonKey()
        Doctor? doctor,
    @JsonKey()
        UserModel? patient,
    @JsonKey(
      fromJson: DateTimeUtils.parseDateTimeDateOnly,
      toJson: DateTimeUtils.formatDateTimeDateOnly,
    )
        DateTime? appointmentBookingDate,
    @JsonKey(
      fromJson: DateTimeUtils.fromStringToTimeType2,
      toJson: DateTimeUtils.fromTimeToStringType2,
    )
        DateTime? appointmentStartTime,
    @JsonKey(
      fromJson: DateTimeUtils.fromStringToTimeType2,
      toJson: DateTimeUtils.fromTimeToStringType2,
    )
        DateTime? appointmentEndTime,
    @JsonKey(
      fromJson: DateTimeUtils.parseDateTime,
      toJson: DateTimeUtils.formatDateTime,
    )
        DateTime? createdAt,
    @JsonKey()
        String? describeSymptoms,
    @JsonKey()
        String? appointmentStatus,
    @JsonKey()
        String? reason,
    @JsonKey()
        bool? forSelf,
  }) = _Appointment;

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);
}
