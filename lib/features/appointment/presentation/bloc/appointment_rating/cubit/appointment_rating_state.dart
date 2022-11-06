part of 'appointment_rating_cubit.dart';

@freezed
class AppointmentRatingState with _$AppointmentRatingState {
  const factory AppointmentRatingState({
    @Default(StateStatus.initial) StateStatus status,
    @Default(Comment.pure()) Comment comment,
    @Default(3.0) double rating,
    NetworkException? exception,
  }) = _AppointmentRatingState;
}
