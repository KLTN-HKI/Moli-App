import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:moli_app/src/features/app/bloc/bloc.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required AppSettingsCubit appSettingsCubit,
  })  : _settingsCubit = appSettingsCubit,
        super(const AppState.maintenance()) {
    // On bloc
    on<_UpdateState>(_onUpdateState);

    // Init app
    _settingsCubit.initial();
  }

  final AppSettingsCubit _settingsCubit;

  FutureOr<void> _onUpdateState(_UpdateState event, Emitter<AppState> emit) {
    emit(event.state);
  }
}
