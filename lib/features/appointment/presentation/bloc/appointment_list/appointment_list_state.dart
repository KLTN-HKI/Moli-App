part of 'appointment_list_cubit.dart';

@freezed
class AppointmentListState with _$AppointmentListState {
  const factory AppointmentListState.initial() = _Initial;
  const factory AppointmentListState.success({
    required AppointmentList appointmentList,
    @Default(false) bool isLoading,
  }) = _Success;
  const factory AppointmentListState.failed(NetworkException ex) = _Failed;
}
