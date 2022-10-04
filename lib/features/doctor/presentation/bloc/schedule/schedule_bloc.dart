import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/config/dependency_container.dart';
import 'package:moli_app/features/doctor/data/doctor_repository.dart';
import 'package:moli_app/features/doctor/data/doctor_repository_api.dart';
import 'package:moli_app/features/doctor/domain/schedule.dart';
import 'package:moli_app/shared/shared.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';
part 'schedule_bloc.freezed.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc()
      : _repository = getIt<DoctorRepositoryApi>(),
        super(const _Initial()) {
    on<_FetchSchedule>(_onFetchDoctorSchedule);
  }
  final DoctorRepository _repository;

  Future<void> _onFetchDoctorSchedule(
      _FetchSchedule event, Emitter<ScheduleState> emit) async {
    try {
      final DoctorAvailableTime data = await _repository.fetchDoctorsSchedule(
        data: <String, dynamic>{
          'page': 0,
          'size': 100,
          'doctorId': event.doctorId,
        },
      );
      emit(ScheduleState.success(
        schedule: data,
        isLoading: false,
      ));
    } on NetworkException catch (e) {
      emit(ScheduleState.failed(e));
    }
  }
}
