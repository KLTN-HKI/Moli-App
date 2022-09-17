import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../authentication_service.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationService authenticationService,
  })  : _authService = authenticationService,
        super(const AuthenticationState.unauthenticated()) {
    on<_Initial>(_onInitial);
    on<_LoggedIn>(_onLoggedIn);
    on<_LoggedOut>(_onLoggedOut);
  }

  final AuthenticationService _authService;

  FutureOr<void> _onInitial(
      _Initial event, Emitter<AuthenticationState> emit) async {
    final String? authenticated = await _authService.getAuthToken();
    final bool? isFirstTime = await _authService.getFirstTime();
    log('token: $authenticated');
    if (isFirstTime == null || isFirstTime) {
      emit(const AuthenticationState.firstTime());
    } else if (authenticated == null || authenticated == '') {
      _onLoggedOut(const _LoggedOut(), emit);
    } else {
      emit(const AuthenticationState.authenticated());
    }
  }

  FutureOr<void> _onLoggedIn(
      _LoggedIn event, Emitter<AuthenticationState> emit) async {
    emit(const AuthenticationState.authenticating());
    await _authService.setAuthAccessToken(event.accessToken);
    // await _authService.setAuthRefreshToken(event.accessToken);
    emit(const AuthenticationState.authenticated());
  }

  FutureOr<void> _onLoggedOut(
      _LoggedOut event, Emitter<AuthenticationState> emit) {
    _authService.clearAuthKey();
    emit(const AuthenticationState.unauthenticated());
  }
}
