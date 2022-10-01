import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/config/config.dart';
import 'package:moli_app/features/features.dart';
import 'package:moli_app/shared/shared.dart';

import '../../../domain/formz/phone_number.dart';

part 'phone_state.dart';
part 'phone_cubit.freezed.dart';

class PhoneCubit extends Cubit<PhoneState> {
  PhoneCubit()
      : _authRepo = getIt(),
        super(const PhoneState.initial());

  final AuthenticationRepository _authRepo;

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
          params: <String, dynamic>{'username': state.phoneNumber.value});
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
