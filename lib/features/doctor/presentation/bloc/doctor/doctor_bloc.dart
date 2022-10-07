import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/config/dependency_container.dart';
import 'package:moli_app/shared/shared.dart';

import '../../../data/doctor_repository.dart';
import '../../../data/doctor_repository_api.dart';
import '../../../domain/doctor.dart';

part 'doctor_event.dart';
part 'doctor_state.dart';
part 'doctor_bloc.freezed.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  DoctorBloc()
      : _repository = getIt<DoctorRepositoryApi>(),
        super(const DoctorState.initial()) {
    on<_FetchDoctorsByHospitalId>(_onFetchDoctorsByHospitalId);
  }

  final DoctorRepository _repository;

  Future<void> _onFetchDoctorsByHospitalId(
      _FetchDoctorsByHospitalId event, Emitter<DoctorState> emit) async {
    try {
      final DoctorList oldData = state.maybeWhen(
          success: (DoctorList doctors, bool isLoading) => doctors,
          orElse: () => const DoctorList());
      emit(DoctorState.success(doctors: oldData, isLoading: false));
      final DoctorList newData = await _repository.fetchDoctorsByHospitalId(
        data: <String, dynamic>{
          'page': event.page ?? 0,
        },
        hospitalId: event.hospitalId,
      );
      if (newData.pagination.currentPage > oldData.pagination.currentPage) {
        emit(
          DoctorState.success(
            doctors:
                newData.copyWith(doctors: newData.doctors + oldData.doctors),
            isLoading: false,
          ),
        );
      } else {
        emit(DoctorState.success(
          doctors: newData,
          isLoading: false,
        ));
      }
    } on NetworkException catch (e) {
      emit(DoctorState.failed(e));
    }
  }
}
