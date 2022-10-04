import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/shared/shared.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';

@freezed
 class DoctorAvailableTime with _$DoctorAvailableTime {
  const factory DoctorAvailableTime({
    @JsonKey()
    @Default(<DoctorSchedule>[])
        List<DoctorSchedule> doctorSchedules,
    @JsonKey() @Default(Pagination()) Pagination pagination,
  }) = _DoctorAvailableTime;

  factory DoctorAvailableTime.fromJson(Map<String, dynamic> json) =>
      _$DoctorAvailableTimeFromJson(json);
}

@freezed
 class DoctorSchedule with _$DoctorSchedule {
  const factory DoctorSchedule({
    @JsonKey() required int id,
    @JsonKey(fromJson: DateTimeUtils.parseDateTimeDateOnly, toJson: DateTimeUtils.formatDateTimeDateOnly)
        DateTime? workDay,
    @JsonKey(fromJson: DateTimeUtils.fromStringToTimeType2, toJson: DateTimeUtils.fromTimeToStringType2)
        DateTime? workTimeStart,
    @JsonKey(fromJson: DateTimeUtils.fromStringToTimeType2, toJson: DateTimeUtils.fromTimeToStringType2)
        DateTime? workTimeEnd,
  }) = _DoctorSchedule;

  factory DoctorSchedule.fromJson(Map<String, dynamic> json) =>
      _$DoctorScheduleFromJson(json);
}
