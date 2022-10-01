import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/config/dependency_container.dart';
import 'package:moli_app/features/authentication/domain/response/user_model.dart';
import 'package:moli_app/features/features.dart';
import 'package:moli_app/shared/shared.dart';

import '../../../domain/formz/password.dart';
import '../../../domain/formz/phone_number.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : _authRepo = getIt(),
        _authBloc = getIt(),
        super(const LoginState.initial());

  final AuthenticationRepository _authRepo;
  final AuthenticationBloc _authBloc;

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

  Future<void> login(String phoneNumber, String password) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      final String result =
          await _authRepo.sendLoginData(data: <String, dynamic>{
        'username': phoneNumber,
        'password': password,
      });
      _authBloc.add(AuthenticationEvent.saveToken(result));
      
      final UserModel user = await _authRepo.getUserInfo();
      _authBloc.add(AuthenticationEvent.loggedIn(user));
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on NetworkException catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure, exception: e));
    }
  }
}
