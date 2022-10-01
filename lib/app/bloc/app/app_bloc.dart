import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/features/features.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(AuthenticationBloc authenticationBloc)
      : super(const AppState.initial()) {
    on<_UpdateState>(_onUpdateState);

    // Listen Authen Bloc
    authenticationBloc.stream.listen((AuthenticationState authState) {
      authState.whenOrNull(
        unauthenticated: () =>
            add(const AppEvent.updateState(AppState.login())),
        authenticated: (_) => add(const AppEvent.updateState(AppState.home())),
        firstTime: () =>
            add(const AppEvent.updateState(AppState.firstTimeLogin())),
      );
    });
  }

  FutureOr<void> _onUpdateState(_UpdateState event, Emitter<AppState> emit) {
    emit(event.state);
  }
}
