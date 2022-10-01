import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/shared/services/firebase/firebase_authentication.dart';

part 'otp_state.dart';
part 'otp_cubit.freezed.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(const OtpState.initial());

  final MoliCloudAuthentication _authenticaiton =
      MoliCloudAuthentication.instance;

  String? _verificationId;

  Future<void> sendOTP(String phoneNumber) async {
    emit(const OtpState.loading());
    await _authenticaiton.auth!.verifyPhoneNumber(
      //số điện thoại xác thực
      phoneNumber: phoneNumber,
      //Firebase gửi code
      codeSent: (String verificationId, int? forceResendingToken) {
        _verificationId = verificationId;
        emit(const OtpState.codeSent());
      },
      //nếu xác thực thành công
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
        signInWithPhone(phoneAuthCredential);
      },
      verificationFailed: (FirebaseAuthException error) {
        log(error.toString());
        emit(OtpState.failed(error.message.toString()));
      },
      //thời gian code hết hạn
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
      timeout: Duration.zero,
    );
  }

  Future<void> verifyOTP(String smsOTP) async {
    emit(const OtpState.loading());
    log('_verificationId: $_verificationId');
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!, smsCode: smsOTP);
    signInWithPhone(credential);
  }

  Future<void> signInWithPhone(PhoneAuthCredential credential) async {
    try {
      final UserCredential userCredential =
          await _authenticaiton.auth!.signInWithCredential(credential);
      if (userCredential.user != null) {
        emit(const OtpState.success());
      }
    } on FirebaseAuthException catch (ex) {
      log(ex.toString());
      emit(OtpState.failed(ex.message.toString()));
    }
  }
}
