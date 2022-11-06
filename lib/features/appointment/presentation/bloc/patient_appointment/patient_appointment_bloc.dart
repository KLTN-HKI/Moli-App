import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/config/dependency_container.dart';
import 'package:moli_app/features/appointment/data/appointment_repository.dart';
import 'package:moli_app/features/appointment/domain/patient_state.dart';
import 'package:moli_app/features/authentication/authentication.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../../data/appointment_repository_api.dart';

part 'patient_appointment_event.dart';
part 'patient_appointment_state.dart';
part 'patient_appointment_bloc.freezed.dart';

class PatientAppointmentBloc
    extends Bloc<PatientAppointmentEvent, PatientAppointmentState> {
  PatientAppointmentBloc(this.authBloc)
      : _repository = getIt<AppointmentRepositoryApi>(),
        super(const PatientAppointmentState()) {
    on<_Started>(_onStarted);
    on<_Updated>(_onUpdated);

    authBloc.stream.listen((AuthenticationState state) {
      state.whenOrNull(authenticated: (_) {
        add(const PatientAppointmentEvent.started());
      });
    });
  }

  final AuthenticationBloc authBloc;
  final AppointmentRepository _repository;

  Future<void> _onStarted(
      _Started event, Emitter<PatientAppointmentState> emit) async {
    try {
      final PatientStateResult data = await _repository.getUserState();
      emit(state.copyWith(patientState: data, exception: null));
    } on Exception catch (e) {
      if (e is NetworkException) {
        emit(state.copyWith(exception: e));
      }
    }
  }

  Future<void> _onUpdated(
      _Updated event, Emitter<PatientAppointmentState> emit) async {
    emit(state.copyWith(patientState: event.patientState, exception: null));
  }
}
