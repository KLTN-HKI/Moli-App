part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial({
    @Default(PhoneNumber.pure()) final PhoneNumber phoneNumber,
    @Default(Password.pure()) final Password password,
    @Default(FormzStatus.valid) final FormzStatus status,
  }) = _Initial;

  const factory RegisterState.validating({
    required final PhoneNumber phoneNumber,
    required final Password password,
    required final FormzStatus status,
  }) = _Validating;
}
