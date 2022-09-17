// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

/// A utility class for getting paths for API endpoints.
/// This class has no constructor and all methods are `static`.
@immutable
class AuthenticationEndpoint {
  const AuthenticationEndpoint._();

  /// Returns the path for an authentication [endpoint].
  static String auth(AuthEndpoint endpoint) {
    const String path = '/api';
    switch (endpoint) {
      case AuthEndpoint.REGISTER:
        return '$path/sign-up';
      case AuthEndpoint.LOGIN:
        return '$path/login';
      case AuthEndpoint.REFRESH_TOKEN:
        return '$path/..';
      case AuthEndpoint.RESET_PASSWORD:
        return '$path/reset-password';
      case AuthEndpoint.VERIFY_OTP:
        return '$path/otp'; 
      case AuthEndpoint.CHECK_PHONE_NUMBER:
        return '$path/existing-phone-check';
      case AuthEndpoint.PROFILE:
        return '$path/patient/info';
      case AuthEndpoint.EDIT_PROFILE:
        return '$path/patient/edit-info';
    }
  }
}

enum AuthEndpoint {
  /// An endpoint for registration requests.
  REGISTER,

  /// An endpoint for login requests.
  LOGIN,

  /// An endpoint for token refresh requests.
  REFRESH_TOKEN,

  /// An endpoint for reset password requests.
  RESET_PASSWORD,

  /// An endpoint for verifying otp code.
  VERIFY_OTP,

  /// An endpoint for checking phone number.
  CHECK_PHONE_NUMBER,

  /// An endpoint for get user info.
  PROFILE,

  /// An endpoint for edit user info
  EDIT_PROFILE,
}
