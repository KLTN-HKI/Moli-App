part of 'otp_cubit.dart';

@freezed
class OtpState with _$OtpState {
  const factory OtpState.initial() = _Initial;
  const factory OtpState.loading() = _Loading;
  const factory OtpState.codeSent() = _CodeSent;
  const factory OtpState.success() = _Success;
  const factory OtpState.failed(String error) = _Failed;
}
