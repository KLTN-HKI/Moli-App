part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial({
    @Default(PhoneNumber.pure()) final PhoneNumber phoneNumber,
    @Default(Password.pure()) final Password password,
    NetworkException? exception,
    @Default(FormzStatus.valid) final FormzStatus status,
  }) = _Initial;
}
