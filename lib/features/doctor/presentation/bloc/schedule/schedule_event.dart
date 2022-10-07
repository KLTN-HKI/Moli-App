part of 'schedule_bloc.dart';

@freezed
class ScheduleEvent with _$ScheduleEvent {
  const factory ScheduleEvent.fetchSchedule(
      {required int doctorId, String? dayOfYear}) = _FetchSchedule;
}
