import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/shared/shared.dart';

import '../../../authentication.dart';
import '../../../domain/form/form.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({
    required AuthenticationRepository authenticationRepository,
  })  : _authRepo = authenticationRepository,
        super(RegisterState.initial());

  final AuthenticationRepository _authRepo;

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

  Future<void> register() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authRepo.sendRegisterData(data: <String, dynamic>{
        'phoneNumber': state.phoneNumber.value,
        'password': state.password.value,
      });

      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on NetworkException catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
