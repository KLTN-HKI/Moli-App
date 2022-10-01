import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/shared/shared.dart';

part 'hospital.freezed.dart';
part 'hospital.g.dart';

@freezed
class Hospital with _$Hospital {
  const factory Hospital({
    @JsonKey() required int id,
    @JsonKey() String? hospitalName,
    @JsonKey() HospitalAddress? hospitalAddress,
    @JsonKey(fromJson: DateTimeUtils.fromStringToTimeType2, toJson: DateTimeUtils.fromTimeToStringType2)
        DateTime? workTimeStart,
    @JsonKey(fromJson: DateTimeUtils.fromStringToTimeType2, toJson: DateTimeUtils.fromTimeToStringType2)
        DateTime? workTimeEnd,
    @JsonKey() @Default(<Doctor>[]) List<Doctor>? doctors,
  }) = _Hospital;
  factory Hospital.fromJson(JSON json) => _$HospitalFromJson(json);
}

@freezed
class HospitalList with _$HospitalList {
  const factory HospitalList({
    @JsonKey() @Default(<Hospital>[]) List<Hospital> hospitals,
    @JsonKey() @Default(Pagination()) Pagination pagination,
  }) = _HospitalList;

  // To JSON
  const HospitalList._();

  factory HospitalList.fromJson(JSON json) => _$HospitalListFromJson(json);
}

@freezed
class HospitalAddress with _$HospitalAddress {
  const factory HospitalAddress({
    @JsonKey() int? id,
    @JsonKey() String? city,
    @JsonKey() String? district,
    @JsonKey() String? street,
    @JsonKey() String? addressDetail,
  }) = _HospitalAddress;
  factory HospitalAddress.fromJson(JSON json) =>
      _$HospitalAddressFromJson(json);
}

@freezed
class Doctor with _$Doctor {
  const factory Doctor({
    @JsonKey() required int id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'phoneNumber') String? phoneNumber,
    @JsonKey(name: 'realPhoneNumber') String? realPhoneNumber,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'gender') String? gender,
    @JsonKey(name: 'dateOfBirth') String? dateOfBirth,
    @JsonKey(name: 'citizenIdentification') String? citizenIdentification,
    @JsonKey(name: 'email') String? email,
    @JsonKey() Degree? degree,
    @JsonKey() @Default(<Specialist>[]) List<Specialist> specialists,
  }) = _Doctor;
  factory Doctor.fromJson(JSON json) => _$DoctorFromJson(json);
}

@freezed
class Degree with _$Degree {
  const factory Degree({
    @JsonKey() required int id,
    @JsonKey() String? degreeLabel,
    @JsonKey() String? degreeName,
  }) = _Degree;
  factory Degree.fromJson(JSON json) => _$DegreeFromJson(json);
}

@freezed
class Specialist with _$Specialist {
  const factory Specialist({
    @JsonKey() required int id,
    @JsonKey() String? specialistName,
  }) = _Specialist;
  factory Specialist.fromJson(JSON json) => _$SpecialistFromJson(json);
}
