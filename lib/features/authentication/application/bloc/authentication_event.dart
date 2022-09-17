part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.init() = _Initial;
  const factory AuthenticationEvent.loggedIn({
    required String accessToken,
    // required String refreshToken,
  }) = _LoggedIn;
  const factory AuthenticationEvent.loggedOut() = _LoggedOut;
}
