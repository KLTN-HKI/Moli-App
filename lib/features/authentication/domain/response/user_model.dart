import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_shared/moli_shared.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

enum Gender {
  @JsonValue('MALE')
  male('MALE'),
  @JsonValue('FEMALE')
  female('FEMALE'),
  @JsonValue('OTHER')
  other('OTHER');

  const Gender(this.gender);
  final String gender;

  @override
  String toString() {
    switch (gender) {
      case 'FEMALE':
        return AppLanguage.current.female;
      case 'MALE':
        return AppLanguage.current.male;
      case 'OTHER':
        return AppLanguage.current.other;
      default:
        return AppLanguage.current.male;
    }
  }
}

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'phoneNumber') String? phoneNumber,
    @JsonKey(name: 'realPhoneNumber') String? realPhoneNumber,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'gender') Gender? gender,
    @JsonKey(name: 'dateOfBirth') String? dateOfBirth,
    @JsonKey(name: 'citizenIdentification') String? citizenIdentification,
    @JsonKey(name: 'email') String? email,
    // @JsonKey(name: 'refresh_token') String? refreshToken,
  }) = _UserModel;

  factory UserModel.fromJson(JSON json) => _$UserModelFromJson(json);
}
