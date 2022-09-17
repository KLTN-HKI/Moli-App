// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_up_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignUpModel _$SignUpModelFromJson(Map<String, dynamic> json) {
  return _SignUpModel.fromJson(json);
}

/// @nodoc
mixin _$SignUpModel {
  @JsonKey(name: 'first-name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last-name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'password')
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone-code-id')
  int? get phoneCodeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone-number')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'referral')
  String? get referral => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignUpModelCopyWith<SignUpModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpModelCopyWith<$Res> {
  factory $SignUpModelCopyWith(
          SignUpModel value, $Res Function(SignUpModel) then) =
      _$SignUpModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'first-name') String? firstName,
      @JsonKey(name: 'last-name') String? lastName,
      @JsonKey(name: 'password') String? password,
      @JsonKey(name: 'phone-code-id') int? phoneCodeId,
      @JsonKey(name: 'phone-number') String? phoneNumber,
      @JsonKey(name: 'referral') String? referral});
}

/// @nodoc
class _$SignUpModelCopyWithImpl<$Res> implements $SignUpModelCopyWith<$Res> {
  _$SignUpModelCopyWithImpl(this._value, this._then);

  final SignUpModel _value;
  // ignore: unused_field
  final $Res Function(SignUpModel) _then;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? password = freezed,
    Object? phoneCodeId = freezed,
    Object? phoneNumber = freezed,
    Object? referral = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneCodeId: phoneCodeId == freezed
          ? _value.phoneCodeId
          : phoneCodeId // ignore: cast_nullable_to_non_nullable
              as int?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      referral: referral == freezed
          ? _value.referral
          : referral // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_SignUpModelCopyWith<$Res>
    implements $SignUpModelCopyWith<$Res> {
  factory _$$_SignUpModelCopyWith(
          _$_SignUpModel value, $Res Function(_$_SignUpModel) then) =
      __$$_SignUpModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'first-name') String? firstName,
      @JsonKey(name: 'last-name') String? lastName,
      @JsonKey(name: 'password') String? password,
      @JsonKey(name: 'phone-code-id') int? phoneCodeId,
      @JsonKey(name: 'phone-number') String? phoneNumber,
      @JsonKey(name: 'referral') String? referral});
}

/// @nodoc
class __$$_SignUpModelCopyWithImpl<$Res> extends _$SignUpModelCopyWithImpl<$Res>
    implements _$$_SignUpModelCopyWith<$Res> {
  __$$_SignUpModelCopyWithImpl(
      _$_SignUpModel _value, $Res Function(_$_SignUpModel) _then)
      : super(_value, (v) => _then(v as _$_SignUpModel));

  @override
  _$_SignUpModel get _value => super._value as _$_SignUpModel;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? password = freezed,
    Object? phoneCodeId = freezed,
    Object? phoneNumber = freezed,
    Object? referral = freezed,
  }) {
    return _then(_$_SignUpModel(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneCodeId: phoneCodeId == freezed
          ? _value.phoneCodeId
          : phoneCodeId // ignore: cast_nullable_to_non_nullable
              as int?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      referral: referral == freezed
          ? _value.referral
          : referral // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SignUpModel implements _SignUpModel {
  const _$_SignUpModel(
      {@JsonKey(name: 'first-name') this.firstName,
      @JsonKey(name: 'last-name') this.lastName,
      @JsonKey(name: 'password') this.password,
      @JsonKey(name: 'phone-code-id') this.phoneCodeId,
      @JsonKey(name: 'phone-number') this.phoneNumber,
      @JsonKey(name: 'referral') this.referral});

  factory _$_SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$$_SignUpModelFromJson(json);

  @override
  @JsonKey(name: 'first-name')
  final String? firstName;
  @override
  @JsonKey(name: 'last-name')
  final String? lastName;
  @override
  @JsonKey(name: 'password')
  final String? password;
  @override
  @JsonKey(name: 'phone-code-id')
  final int? phoneCodeId;
  @override
  @JsonKey(name: 'phone-number')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'referral')
  final String? referral;

  @override
  String toString() {
    return 'SignUpModel(firstName: $firstName, lastName: $lastName, password: $password, phoneCodeId: $phoneCodeId, phoneNumber: $phoneNumber, referral: $referral)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpModel &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.phoneCodeId, phoneCodeId) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.referral, referral));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(phoneCodeId),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(referral));

  @JsonKey(ignore: true)
  @override
  _$$_SignUpModelCopyWith<_$_SignUpModel> get copyWith =>
      __$$_SignUpModelCopyWithImpl<_$_SignUpModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignUpModelToJson(
      this,
    );
  }
}

abstract class _SignUpModel implements SignUpModel {
  const factory _SignUpModel(
      {@JsonKey(name: 'first-name') final String? firstName,
      @JsonKey(name: 'last-name') final String? lastName,
      @JsonKey(name: 'password') final String? password,
      @JsonKey(name: 'phone-code-id') final int? phoneCodeId,
      @JsonKey(name: 'phone-number') final String? phoneNumber,
      @JsonKey(name: 'referral') final String? referral}) = _$_SignUpModel;

  factory _SignUpModel.fromJson(Map<String, dynamic> json) =
      _$_SignUpModel.fromJson;

  @override
  @JsonKey(name: 'first-name')
  String? get firstName;
  @override
  @JsonKey(name: 'last-name')
  String? get lastName;
  @override
  @JsonKey(name: 'password')
  String? get password;
  @override
  @JsonKey(name: 'phone-code-id')
  int? get phoneCodeId;
  @override
  @JsonKey(name: 'phone-number')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'referral')
  String? get referral;
  @override
  @JsonKey(ignore: true)
  _$$_SignUpModelCopyWith<_$_SignUpModel> get copyWith =>
      throw _privateConstructorUsedError;
}
