import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/features/features.dart';
import 'package:moli_app/shared/shared.dart';

import '../../../domain/form/phone_number.dart';

part 'phone_state.dart';
part 'phone_cubit.freezed.dart';

class PhoneCubit extends Cubit<PhoneState> {
  PhoneCubit({
    required AuthenticationRepository authenticationRepository,
    required AuthenticationBloc authenticationBloc,
  })  : _authRepo = authenticationRepository,
        _authBloc = authenticationBloc,
        super(const PhoneState.initial());

  final AuthenticationRepository _authRepo;
  final AuthenticationBloc _authBloc;

  void phoneNumberChanged(String value) {
    final PhoneNumber phoneNumber = PhoneNumber.dirty(value);
    emit(
      state.copyWith(
        phoneNumber: phoneNumber,
        status: Formz.validate(<FormzInput<dynamic, dynamic>>[phoneNumber]),
      ),
    );
  }

  Future<void> checkPhoneNumberExist() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      final bool result = await _authRepo.checkPhoneNumberExist(
          params: <String, dynamic>{'phoneNumber': state.phoneNumber.value});
      log(result.toString());
      if (!result) {
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    } on NetworkException catch (e) {
      log(e.toString());
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
