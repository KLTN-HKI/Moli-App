import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_shared/moli_shared.dart';

part 'patient_state.freezed.dart';
part 'patient_state.g.dart';

@freezed
class PatientStateResult with _$PatientStateResult {
  const factory PatientStateResult({
    @JsonKey()
    @Default(<AppointmentNotRating>[])
        List<AppointmentNotRating> appointmentNotRatings,
    @JsonKey() @Default(0) int appointmentsBookToday,
  }) = _PatientStateResult;

  factory PatientStateResult.fromJson(JSON json) =>
      _$PatientStateResultFromJson(json);
}

@freezed
class AppointmentNotRating with _$AppointmentNotRating {
  const factory AppointmentNotRating({
    @JsonKey() String? appointmentUuid,
    @JsonKey() int? doctorId,
    @JsonKey() bool? rating,
  }) = _AppointmentNotRating;

  factory AppointmentNotRating.fromJson(JSON json) =>
      _$AppointmentNotRatingFromJson(json);
}
