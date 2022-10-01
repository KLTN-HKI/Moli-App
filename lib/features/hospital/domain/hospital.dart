import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/shared/shared.dart';

import '../../doctor/domain/doctor.dart';

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
