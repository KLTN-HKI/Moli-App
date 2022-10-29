import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/config/dependency_container.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../../data/doctor_repository.dart';
import '../../../data/doctor_repository_api.dart';
import '../../../domain/doctor.dart';

part 'doctor_list_state.dart';
part 'doctor_list_cubit.freezed.dart';

class DoctorListCubit extends Cubit<DoctorListState> {
  DoctorListCubit()
      : _repository = getIt<DoctorRepositoryApi>(),
        super(const DoctorListState());

  final DoctorRepository _repository;
  Future<void> getAllDoctor([String? doctorQuery]) async {
    emit(state.copyWith(status: StateStatus.loading));
    try {
      final DoctorList result =
          await _repository.fetchAllDoctor(data: <String, dynamic>{
        if (!StringUtils.isNullOrBlank(doctorQuery)) 'doctorQuery': doctorQuery,
      });

      emit(state.copyWith(
        status: StateStatus.success,
        doctors: result,
        isLoading: false,
        term: doctorQuery,
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
      final DoctorList dataOld = state.doctors;
      if (dataOld != null && dataOld.pagination.hasMore) {
        emit(
            state.copyWith(doctors: dataOld, isLoading: true, exception: null));
        final DoctorList dataNew = await _repository.fetchAllDoctor(
          data: <String, dynamic>{
            if (!StringUtils.isNullOrBlank(state.term))
              'doctorQuery': state.term,
            'page': dataOld.pagination.currentPage + 1,
          },
        );
        emit(state.copyWith(
          status: StateStatus.success,
          doctors: dataNew.copyWith(doctors: dataOld.doctors + dataNew.doctors),
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
