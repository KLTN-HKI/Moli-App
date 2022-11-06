import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/features/authentication/domain/response/response.dart';
import 'package:moli_app/features/doctor/domain/doctor.dart';
import 'package:moli_app/features/hospital/domain/hospital.dart';
import 'package:moli_shared/moli_shared.dart';

part 'appointment.freezed.dart';
part 'appointment.g.dart';

enum AppointmentStatus {
  all(''),
  @JsonValue('PENDING')
  pending('PENDING'),
  @JsonValue('CONFIRM')
  confirm('CONFIRM'),
  @JsonValue('CHANGE')
  change('CHANGE'),
  @JsonValue('CANCEL')
  cancel('CANCEL');

  const AppointmentStatus(this.status);
  final String status;

  bool get isPending => this == pending;
  bool get isConfirm => this == confirm;
  bool get isChange => this == change;
  bool get isCancel => this == cancel;

  String acction() {
    switch (status) {
      case 'PENDING':
        return 'chờ xác nhận';
      case 'CONFIRM':
        return 'xác nhận';
      case 'CHANGE':
        return 'đổi';
      case 'CANCEL':
        return 'hủy';
      default:
        return '';
    }
  }

  @override
  String toString() {
    switch (status) {
      case 'PENDING':
        return 'Chờ xác nhận';
      case 'CONFIRM':
        return 'Đã xác nhận';
      case 'CHANGE':
        return 'Đổi lịch';
      case 'CANCEL':
        return 'Đã hủy';
      default:
        return '';
    }
  }
}

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
class CreateAppointmentResult with _$CreateAppointmentResult {
  const factory CreateAppointmentResult({
    @JsonKey() @Default(Appointment(id: 0)) Appointment appointment,
    @JsonKey() @Default(0) int appointmentBookingCount,
  }) = _CreateAppointmentResult;

  factory CreateAppointmentResult.fromJson(Map<String, dynamic> json) =>
      _$CreateAppointmentResultFromJson(json);
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
        AppointmentStatus? appointmentStatus,
    @JsonKey()
        String? reason,
    @JsonKey()
        bool? forSelf,
  }) = _Appointment;

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);
}
