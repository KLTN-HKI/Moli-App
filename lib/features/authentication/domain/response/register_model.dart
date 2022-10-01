import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/common/common.dart';

part 'register_model.freezed.dart';
part 'register_model.g.dart';

@freezed
class RegisterModel with _$RegisterModel {
  const factory RegisterModel({
    @JsonKey(name: 'username') String? phoneNumber,
    @JsonKey(name: 'password') String? password,
    // @JsonKey(name: 'refresh_token') String? refreshToken,
  }) = _RegisterModel;

  factory RegisterModel.fromJson(JSON json) => _$RegisterModelFromJson(json);
}
