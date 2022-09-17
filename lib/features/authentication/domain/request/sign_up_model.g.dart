// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignUpModel _$$_SignUpModelFromJson(Map<String, dynamic> json) =>
    _$_SignUpModel(
      firstName: json['first-name'] as String?,
      lastName: json['last-name'] as String?,
      password: json['password'] as String?,
      phoneCodeId: json['phone-code-id'] as int?,
      phoneNumber: json['phone-number'] as String?,
      referral: json['referral'] as String?,
    );

Map<String, dynamic> _$$_SignUpModelToJson(_$_SignUpModel instance) =>
    <String, dynamic>{
      'first-name': instance.firstName,
      'last-name': instance.lastName,
      'password': instance.password,
      'phone-code-id': instance.phoneCodeId,
      'phone-number': instance.phoneNumber,
      'referral': instance.referral,
    };
