// ignore_for_file: constant_identifier_names

part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.unauthenticated() = UNAUTHENTICATED;

  const factory AuthenticationState.authenticating() = AUTHENTICATING;

  const factory AuthenticationState.authenticated() = AUTHENTICATED;

  const factory AuthenticationState.failed({required String reason}) = FAILED;
}
