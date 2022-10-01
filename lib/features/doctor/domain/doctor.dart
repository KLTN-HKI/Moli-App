import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/shared/shared.dart';


part 'doctor.freezed.dart';
part 'doctor.g.dart';

@freezed
class DoctorList with _$DoctorList {
  const factory DoctorList({
    @JsonKey() @Default(<Doctor>[]) List<Doctor> doctors,
    @JsonKey() @Default(Pagination()) Pagination pagination,
  }) = _DoctorList;

  // To JSON
  const DoctorList._();

  factory DoctorList.fromJson(JSON json) => _$DoctorListFromJson(json);
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
