import 'package:dio/dio.dart';

abstract class AuthenticationStorageService {
  /// The name of the message on which this interceptor is triggered.
  String get tokenExpiredException => 'TokenExpiredException';

  /// Returns last authentication token
  Future<String?> getAuthToken();

  /// Check error type to be token expired error
  bool checkErrorTokenExpired(Response<dynamic> response);

  /// Make refresh request and get new token
  Future<String?> refreshTokenRequest({
    required DioError dioError,
    required ErrorInterceptorHandler handler,
    required Dio tokenDio,
  });
}
