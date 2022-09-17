part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial({
    @Default(PhoneNumber.pure()) final PhoneNumber phoneNumber,
    @Default(Password.pure()) final Password password,
    @Default(FormzStatus.valid) final FormzStatus status,
  }) = _Initial;
  const factory LoginState.validating({
    required final PhoneNumber phoneNumber,
    required final Password password,
    required final FormzStatus status,
  }) = _Validating;
}
