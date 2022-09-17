import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/features/features.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required AuthenticationBloc authenticationBloc,
  }) : super(const AppState.initial()) {
    on<_UpdateState>(_onUpdateState);

    // Init app
    authenticationBloc.add(const AuthenticationEvent.init());
    // Listen Authen Bloc
    authenticationBloc.stream.listen((AuthenticationState authState) {
      authState.whenOrNull(
        unauthenticated: () =>
            add(const AppEvent.updateState(AppState.unauthenticated())),
        authenticated: () =>
            add(const AppEvent.updateState(AppState.authenticated())),
        firstTime: () =>
            add(const AppEvent.updateState(AppState.firstTimeLogin())),
      );
    });
  }

  FutureOr<void> _onUpdateState(_UpdateState event, Emitter<AppState> emit) {
    emit(event.state);
  }
}
