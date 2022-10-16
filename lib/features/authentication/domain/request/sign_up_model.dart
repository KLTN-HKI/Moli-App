import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_shared/moli_shared.dart';

part 'sign_up_model.freezed.dart';
part 'sign_up_model.g.dart';

@freezed
class SignUpModel with _$SignUpModel {
  const factory SignUpModel({
    @JsonKey(name: 'first-name') String? firstName,
    @JsonKey(name: 'last-name') String? lastName,
    @JsonKey(name: 'password') String? password,
    @JsonKey(name: 'phone-code-id') int? phoneCodeId,
    @JsonKey(name: 'phone-number') String? phoneNumber,
    @JsonKey(name: 'referral') String? referral,
  }) = _SignUpModel;

  factory SignUpModel.fromJson(JSON json) => _$SignUpModelFromJson(json);
}
