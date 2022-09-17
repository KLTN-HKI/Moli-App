import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/common/common.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginModel with _$LoginModel {
  const factory LoginModel({
    @JsonKey(name: 'tokenType') String? tokenType,
    @JsonKey(name: 'accessToken') String? accessToken,
    // @JsonKey(name: 'refresh_token') String? refreshToken,
  }) = _LoginModel;

  factory LoginModel.fromJson(JSON json) => _$LoginModelFromJson(json);
}
