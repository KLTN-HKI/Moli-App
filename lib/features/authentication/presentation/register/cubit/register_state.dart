part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial({
    @Default(PhoneNumber.pure()) final PhoneNumber phoneNumber,
    @Default(Email.pure()) final Email email,
    @Default(Password.pure()) final Password password,
    @Default(ConfirmPassword.pure())
        final ConfirmPassword confirmPassword,
    @Default(FormzStatus.valid) final FormzStatus status,
  }) = _Initial;

  const factory RegisterState.validating({
    required final PhoneNumber phoneNumber,
    required final Email email,
    required final Password password,
    required final ConfirmPassword confirmPassword,
    required final FormzStatus status,
  }) = _Validating;
}
