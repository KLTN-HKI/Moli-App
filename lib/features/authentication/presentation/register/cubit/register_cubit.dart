import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/config/config.dart';
import 'package:moli_app/features/authentication/domain/response/register_model.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../../authentication.dart';
import '../../../domain/formz/email.dart';
import '../../../domain/formz/form.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(LoginCubit loginCubit)
      : _authRepo = getIt(),
        _loginBloc = loginCubit,
        super(const RegisterState.initial());

  final AuthenticationRepository _authRepo;
  final LoginCubit _loginBloc;

  void phoneChanged(String value) {
    final PhoneNumber phone = PhoneNumber.dirty(value);
    emit(
      state.copyWith(
        phoneNumber: phone,
        status: Formz.validate(
            <FormzInput<dynamic, dynamic>>[phone, state.email, state.password]),
      ),
    );
  }

  void emailChanged(String value) {
    final Email email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate(<FormzInput<dynamic, dynamic>>[
          state.phoneNumber,
          email,
          state.password,
          state.confirmPassword,
        ]),
      ),
    );
  }

  void passwordChanged(String value) {
    final Password password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate(<FormzInput<dynamic, dynamic>>[
          state.phoneNumber,
          state.email,
          password,
          state.confirmPassword,
        ]),
      ),
    );
  }

  void confirmPasswordChanged(String value) {
    final ConfirmPassword confirmPassword =
        ConfirmPassword.dirty(password: state.password.value, value: value);
    emit(
      state.copyWith(
        confirmPassword: confirmPassword,
        status: Formz.validate(<FormzInput<dynamic, dynamic>>[
          state.phoneNumber,
          state.email,
          state.password,
          confirmPassword,
        ]),
      ),
    );
  }

  Future<void> register() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      final RegisterModel response =
          await _authRepo.sendRegisterData(data: <String, dynamic>{
        'username': state.phoneNumber.value,
        'email': state.email.value,
        'password': state.password.value,
      });

      if (response != null) {
        _loginBloc.login(state.phoneNumber.value, state.password.value);
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    } on NetworkException {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
