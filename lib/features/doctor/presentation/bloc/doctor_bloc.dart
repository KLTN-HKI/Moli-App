import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/config/dependency_container.dart';
import 'package:moli_app/shared/shared.dart';

import '../../data/doctor_repository.dart';
import '../../data/doctor_repository_api.dart';
import '../../domain/doctor.dart';

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
      final List<Doctor> oldDoctors = state.maybeWhen(
        success: (DoctorList doctors, bool isLoading) {
          emit(DoctorState.success(doctors: doctors, isLoading: true));
          return doctors.doctors;
        },
        orElse: () {
          emit(const DoctorState.initial());
          return <Doctor>[];
        },
      );
      final DoctorList data = await _repository.fetchDoctorsByHospitalId(
        data: <String, dynamic>{
          'page': event.page ?? 0,
        },
        hospitalId: event.hospitalId,
      );

      final List<Doctor> newDoctors = data.doctors;
      emit(
        DoctorState.success(
          doctors: data.copyWith(doctors: oldDoctors + newDoctors),
        ),
      );
    } on NetworkException catch (e) {
      emit(DoctorState.failed(e));
    }
  }
}
