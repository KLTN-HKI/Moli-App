// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

/// A utility class for getting paths for API endpoints.
/// This class has no constructor and all methods are `static`.
@immutable
class ApiEndpoint {
  const ApiEndpoint._();

  /// Returns the path for an authentication [endpoint].
  static String authentication(AuthenticationEndpoint endpoint) {
    const String path = '/api';
    switch (endpoint) {
      case AuthenticationEndpoint.REGISTER:
        return '$path/sign-up';
      case AuthenticationEndpoint.LOGIN:
        return '$path/login';
      case AuthenticationEndpoint.REFRESH_TOKEN:
        return '$path/..';
      case AuthenticationEndpoint.RESET_PASSWORD:
        return '$path/reset-password';
      case AuthenticationEndpoint.VERIFY_OTP:
        return '$path/otp';
      case AuthenticationEndpoint.CHECK_PHONE_NUMBER:
        return '$path/existing-phone-check';
      case AuthenticationEndpoint.PROFILE:
        return '$path/patient/info';
      case AuthenticationEndpoint.EDIT_PROFILE:
        return '$path/patient/edit-info';
      case AuthenticationEndpoint.REGISTER_NOTIFICATION:
        return '$path/notification/registration-token';
    }
  }
}

enum AuthenticationEndpoint {
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

  REGISTER_NOTIFICATION
}
