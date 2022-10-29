import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/config/config.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../../data/doctor_repository.dart';
import '../../../data/doctor_repository_api.dart';
import '../../../domain/doctor.dart';

part 'doctor_state.dart';
part 'doctor_cubit.freezed.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit()
      : _repository = getIt<DoctorRepositoryApi>(),
        super(const DoctorState());

  final DoctorRepository _repository;

  Future<void> getDoctorDetail(int doctorId) async {
    try {
      emit(state.copyWith(status: StateStatus.loading));
      final Doctor doctor =
          await _repository.fetchDoctorById(doctorId: doctorId);
      emit(state.copyWith(
        status: StateStatus.success,
        doctor: doctor,
        isLoading: false,
        exception: null,
      ));
    } on NetworkException catch (e) {
      emit(state.copyWith(
          status: StateStatus.failure, exception: e, isLoading: false));
    }
  }
}
