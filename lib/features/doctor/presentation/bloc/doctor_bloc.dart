import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/features/hospital/domain/hospital.dart';
import 'package:moli_app/shared/shared.dart';

part 'doctor_event.dart';
part 'doctor_state.dart';
part 'doctor_bloc.freezed.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  DoctorBloc() : super(const _Initial()) {
    on<DoctorEvent>((DoctorEvent event, Emitter<DoctorState> emit) {
    });
  }
}
