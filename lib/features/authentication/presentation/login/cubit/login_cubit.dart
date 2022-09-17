import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/features/authentication/domain/response/user_model.dart';
import 'package:moli_app/features/features.dart';
import 'package:moli_app/shared/shared.dart';

import '../../../domain/form/password.dart';
import '../../../domain/form/phone_number.dart';
import '../../../domain/response/login_model.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required AuthenticationRepository authenticationRepository,
    required AuthenticationBloc authenticationBloc,
    required AuthenticationService authenticationService,
  })  : _authRepo = authenticationRepository,
        _authBloc = authenticationBloc,
        _authService = authenticationService,
        super(const LoginState.initial());

  final AuthenticationRepository _authRepo;
  final AuthenticationBloc _authBloc;
  final AuthenticationService _authService;

  void phoneNumberChanged(String value) {
    final PhoneNumber phoneNumber = PhoneNumber.dirty(value);
    emit(
      state.copyWith(
        phoneNumber: phoneNumber,
        status: Formz.validate(
            <FormzInput<dynamic, dynamic>>[phoneNumber, state.password]),
      ),
    );
  }

  void passwordChanged(String value) {
    final Password password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate(
            <FormzInput<dynamic, dynamic>>[state.phoneNumber, password]),
      ),
    );
  }

  Future<void> login() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      final LoginModel result =
          await _authRepo.sendLoginData(data: <String, dynamic>{
        'username': state.phoneNumber.value,
        'password': state.password.value,
      });
      if (result != null) {
        _authBloc.add(AuthenticationEvent.loggedIn(
          accessToken: result.accessToken ?? '',
          // refreshToken: result.refreshToken ?? '',
        ));

        final UserModel user = await _authRepo.getUserInfo();
        if (user != null) {
          await _authService.setCurrentUser(jsonEncode(user));
        }

        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      }
    } on NetworkException catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
