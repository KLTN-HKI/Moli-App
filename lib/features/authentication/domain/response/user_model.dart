import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/shared/common/common.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'phoneNumber') String? phoneNumber,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'gender') String? gender,
    @JsonKey(name: 'dateOfBirth') String? dateOfBirth,
    @JsonKey(name: 'citizenIdentification') String? citizenIdentification,
    @JsonKey(name: 'email') String? email,
    // @JsonKey(name: 'refresh_token') String? refreshToken,
  }) = _UserModel;

  factory UserModel.fromJson(JSON json) => _$UserModelFromJson(json);
}
