import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../shared/shared.dart';
import '../data/authentication_endpoint.dart';

class AuthenticationService extends AuthenticationStorageService {
  /// The name of auth access token key
  static const String _authTokenAccessKey = 'authTokenAccessKey';

  /// The name of auth refresh token key
  static const String _authTokenRefreshKey = 'authTokenRefreshKey';

  /// The name of user info key
  static const String _currentUserKey = 'currentUserKey';

  final KeyValueStorageBase _keyValueStorage = KeyValueStorageBase.instance;

  @override
  String get tokenExpiredException => 'tokenExpiredException';

  @override
  bool checkErrorTokenExpired(Response<dynamic> response) {
    return response.statusCode == 401 &&
        ((response.data as JSON)['errors'] as List<QueryParams>)
                .first['message'] ==
            tokenExpiredException;
  }

  @override
  Future<String?> getAuthToken() async {
    return _keyValueStorage.getEncrypted(_authTokenAccessKey);
  }

  @override
  Future<bool?> getFirstTime() async {
    return _keyValueStorage.getItem<bool?>('onboarding', key: 'firstTime');
  }

  @override
  Future<String?> refreshTokenRequest({
    required DioError dioError,
    required ErrorInterceptorHandler handler,
    required Dio tokenDio,
  }) async {
    log('\x1B[33mAuthenticationService --> REFRESHING TOKEN');
    try {
      final String? token = await getAuthRefreshToken();
      log('\x1B[33m\tBody: $token');

      final Response<JSON> response = await tokenDio.post<JSON>(
        AuthenticationEndpoint.auth(AuthEndpoint.REFRESH_TOKEN),
        data: token,
      );

      log('\x1B[33m\tStatus code:${response.statusCode}');
      log('\x1B[33m\tResponse: ${response.data}');

      return (response.data! as QueryParams)['token'];

      // //Check new token success
      // final bool success = response.data?['headers']['success'] == 1;

      // if (success) {
      //   log('\x1B[33m<-- END REFRESH');
      //   return response.data?['body']['token'] as String;
      // } else {
      //   throw Exception;
      // }
    } on DioError catch (de) {
      //only caught here for logging
      //forward to try-catch in dio_service for handling
      log('\x1B[33m\t--> ERROR');
      log('\x1B[33m\t\t--> Exception: ${de.error}');
      log('\x1B[33m\t\t--> Message: ${de.message}');
      log('\x1B[33m\t\t--> Response: ${de.response}');
      log('\x1B[33m\t<-- END ERROR');
      log('\x1B[33m<-- END REFRESH');
      handler.reject(de);
      return null;
    } on Exception catch (ex) {
      //only caught here for logging
      //forward to try-catch in dio_service for handling
      log('\x1B[33m\t--> ERROR');
      log('\x1B[33m\t\t--> Exception: $ex');
      log('\x1B[33m\t<-- END ERROR');
      log('\x1B[33m<-- END REFRESH');
      return null;
    }
  }

  Future<String?> getAuthRefreshToken() {
    return _keyValueStorage.getEncrypted(_authTokenRefreshKey);
  }

  Future<String?> getCurrentUser() {
    return _keyValueStorage.getEncrypted(_currentUserKey);
  }

  Future<void> setAuthAccessToken(String token) async {
    await _keyValueStorage.setEncrypted(_authTokenAccessKey, token);
  }

  Future<void> setAuthRefreshToken(String token) async {
    await _keyValueStorage.setEncrypted(_authTokenRefreshKey, token);
  }

  Future<void> setCurrentUser(String userinfo) async {
    await _keyValueStorage.setEncrypted(_currentUserKey, userinfo);
  }

  /// Resets the authentication. Even though these methods are asynchronous, we
  /// don't care about their completion which is why we don't use `await` and
  /// let them execute in the background.
  void resetKeys() {
    _keyValueStorage.clearHiveBox();
    _keyValueStorage.clearEncrypted();
  }

  void clearAuthKey() {
    _keyValueStorage.clearEncrypted();
  }
}
