part of 'phone_cubit.dart';

@freezed
class PhoneState with _$PhoneState {
  const factory PhoneState.initial({
    @Default(PhoneNumber.pure()) final PhoneNumber phoneNumber,
    @Default(FormzStatus.valid) final FormzStatus status,
  }) = _Initial;
  const factory PhoneState.validating({
    required final PhoneNumber phoneNumber,
    required final FormzStatus status,
  }) = _Validating;
}
