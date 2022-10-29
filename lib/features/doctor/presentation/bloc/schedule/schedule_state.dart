part of 'schedule_bloc.dart';

@freezed
class ScheduleState with _$ScheduleState {
  const factory ScheduleState({
    @Default(StateStatus.initial) StateStatus status,
    @Default(DoctorAvailableTime()) DoctorAvailableTime schedule,
    @Default(false) bool isLoading,
    NetworkException? exception,
  }) = _ScheduleState;
  /*  const factory ScheduleState.initial() = _Initial;
  const factory ScheduleState.success({
    required DoctorAvailableTime schedule,
    @Default(false) bool isLoading,
  }) = _Success;
  const factory ScheduleState.failed(NetworkException exception) = _Failed; */
}
