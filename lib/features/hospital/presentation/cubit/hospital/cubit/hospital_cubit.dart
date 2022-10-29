import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/config/config.dart';
import 'package:moli_app/features/hospital/data/hospital_repository_api.dart';
import 'package:moli_app/features/hospital/domain/hospital.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../../../data/hospital_repository.dart';

part 'hospital_state.dart';
part 'hospital_cubit.freezed.dart';

class HospitalCubit extends Cubit<HospitalState> {
  HospitalCubit()
      : _repository = getIt<HospitalRepositoryApi>(),
        super(const HospitalState());

  final HospitalRepository _repository;

  Future<void> getHospitalDetail(int hospitalId) async {
    try {
      emit(state.copyWith(status: StateStatus.loading));
      final Hospital hospital =
          await _repository.fetchHospitalByid(hospitalId: hospitalId);
      emit(state.copyWith(
        status: StateStatus.success,
        hospital: hospital,
        isLoading: false,
        exception: null,
      ));
    } on NetworkException catch (e) {
      emit(state.copyWith(
          status: StateStatus.failure, exception: e, isLoading: false));
    }
  }
}
