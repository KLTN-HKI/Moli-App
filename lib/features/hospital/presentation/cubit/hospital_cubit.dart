import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/config/config.dart';
import 'package:moli_app/features/hospital/data/hospital_repository.dart';
import 'package:moli_app/features/hospital/domain/hospital.dart';
import 'package:moli_app/shared/shared.dart';

import '../../data/hospital_repository_api.dart';

part 'hospital_state.dart';
part 'hospital_cubit.freezed.dart';

class HospitalCubit extends Cubit<HospitalState> {
  HospitalCubit()
      : _repository = getIt<HospitalRepositoryApi>(),
        super(const HospitalState.initial());

  final HospitalRepository _repository;

  Future<void> fetchAllHospital({
    int page = 0,
  }) async {
    try {
      final List<Hospital> hospitalsOld = state.maybeWhen<List<Hospital>>(
          success: (HospitalList hospitals, __) {
        emit(HospitalState.success(hospitals: hospitals, isLoading: true));
        return hospitals.hospitals;
      }, orElse: () {
        emit(const HospitalState.initial());
        return <Hospital>[];
      });

      final HospitalList data =
          await _repository.fetchHospitalList(data: <String, dynamic>{
        'page': page,
        // 'size': 100,
      });
      final List<Hospital> hospitalsNew = data.hospitals;
      emit(
        HospitalState.success(
          hospitals: data.copyWith(
            hospitals: hospitalsOld + hospitalsNew,
          ),
        ),
      );
    } on NetworkException catch (e) {
      emit(HospitalState.failed(e));
    }
  }
}
