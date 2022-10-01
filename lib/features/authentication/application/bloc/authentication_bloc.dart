import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/config/config.dart';
import 'package:moli_app/features/authentication/domain/response/response.dart';
import 'package:moli_app/shared/shared.dart';

import '../../authentication.dart';

part 'authentication_bloc.freezed.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(AuthenticationService authenticationService)
      : _authService = authenticationService,
        _authRepo = getIt(),
        super(const AuthenticationState.unauthenticated()) {
    on<_Initial>(_onInitial, transformer: sequential());
    on<_LoggedIn>(_onLoggedIn, transformer: sequential());
    on<_LoggedOut>(_onLoggedOut, transformer: sequential());
    on<_SaveToken>(_onSaveToken, transformer: sequential());
  }

  final AuthenticationService _authService;
  final AuthenticationRepository _authRepo;

  FutureOr<void> _onInitial(
      _Initial event, Emitter<AuthenticationState> emit) async {
    bool? isFirstTime = true;
    try {
      isFirstTime = await _authService.getFirstTime();
      final String? accessToken = await _authService.getAuthToken();
      final String? userS = await _authService.getCurrentUser();
      if (kDebugMode) {
        log(
            name: runtimeType.toString(),
            '\x1B[32m[AccessToken] User token: $accessToken');
      }
      log('isFirstTime: $isFirstTime');
      await Future<dynamic>.delayed(const Duration(seconds: 3));
      if (isFirstTime == null || isFirstTime) {
        await _authService.setFirstTimeLogin();
        emit(const AuthenticationState.firstTime());
      } else if (accessToken is String && userS is String) {
        final UserModel user = UserModel.fromJson(jsonDecode(userS) as JSON);
        // initFirebase();
        emit(AuthenticationState.authenticated(user));
      } else {
        _onLoggedOut(null, emit);
      }
    } catch (_) {
      _onLoggedOut(null, emit);
    }
  }

  FutureOr<void> _onLoggedIn(
      _LoggedIn event, Emitter<AuthenticationState> emit) async {
    emit(const AuthenticationState.authenticating());
    await _authService.saveCurrentUser(jsonEncode(event.user.toJson()));
    initFirebase();
    emit(AuthenticationState.authenticated(event.user));
  }

  FutureOr<void> _onLoggedOut(
      _LoggedOut? event, Emitter<AuthenticationState> emit) async {
    emit(const AuthenticationState.unauthenticated());
    _authService.clearAuthKey();
    MoliMessaging.instance.deleteToken();
  }

  FutureOr<void> _onSaveToken(
      _SaveToken event, Emitter<AuthenticationState> emit) async {
    await _authService.saveAuthToken(event.token);
  }

  Future<void> initFirebase() async {
    final String? firebaseToken = await MoliMessaging.instance.getToken();
    await _authRepo.registerNotification(data: <String, dynamic>{
      'registrationToken': firebaseToken ?? '',
    });
  }
}
