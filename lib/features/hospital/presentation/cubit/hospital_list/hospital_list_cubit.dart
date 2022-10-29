import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/config/config.dart';
import 'package:moli_app/features/hospital/data/hospital_repository.dart';
import 'package:moli_app/features/hospital/domain/hospital.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../../data/hospital_repository_api.dart';


part 'hospital_list_state.dart';
part 'hospital_list_cubit.freezed.dart';

class HospitalListCubit extends Cubit<HospitalListState> {
  HospitalListCubit()
      : _repository = getIt<HospitalRepositoryApi>(),
        super(const HospitalListState());

  final HospitalRepository _repository;

  Future<void> fetchAllHospital([String? hospitalQuery]) async {
    emit(state.copyWith(status: StateStatus.loading));
    try {
      final HospitalList result =
          await _repository.fetchHospitalList(data: <String, dynamic>{
        if (!StringUtils.isNullOrBlank(hospitalQuery))
          'hospitalQuery': hospitalQuery,
      });

      emit(state.copyWith(
        status: StateStatus.success,
        hospitals: result,
        isLoading: false,
        term: hospitalQuery,
        exception: null,
      ));
    } on NetworkException catch (exception) {
      emit(state.copyWith(
        status: StateStatus.failure,
        exception: exception,
        isLoading: false,
      ));
    }
  }

  Future<void> loadMore() async {
    try {
      final HospitalList dataOld = state.hospitals;
      if (dataOld != null && dataOld.pagination.hasMore) {
        emit(state.copyWith(
            hospitals: dataOld, isLoading: true, exception: null));
        final HospitalList dataNew = await _repository.fetchHospitalList(
          data: <String, dynamic>{
            if (!StringUtils.isNullOrBlank(state.term))
              'hospitalQuery': state.term,
            'page': dataOld.pagination.currentPage + 1,
          },
        );
        emit(state.copyWith(
          status: StateStatus.success,
          hospitals: dataNew.copyWith(
              hospitals: dataOld.hospitals + dataNew.hospitals),
          term: state.term,
          isLoading: false,
          exception: null,
        ));
      }
    } on NetworkException catch (e) {
      emit(state.copyWith(
        status: StateStatus.failure,
        isLoading: false,
        exception: e,
      ));
    }
  }
}
