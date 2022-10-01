import '../../../shared/shared.dart';
import '../domain/response/response.dart';
import 'authentication_endpoint.dart';

class AuthenticationRepository {
  AuthenticationRepository({required ApiService apiService})
      : _apiService = apiService;

  final ApiService _apiService;

  Future<String> sendLoginData({required JSON data}) {
    return _apiService.setData<String>(
      endpoint: ApiEndpoint.authentication(AuthenticationEndpoint.LOGIN),
      data: <String, dynamic>{}..addAll(data),
      requiresAuthToken: false,
      converter: (JSON response) => response['accessToken'] as String,
    );
  }

  Future<RegisterModel> sendRegisterData({required JSON data}) {
    return _apiService.setData<RegisterModel>(
      endpoint: ApiEndpoint.authentication(AuthenticationEndpoint.REGISTER),
      data: data,
      requiresAuthToken: false,
      converter: (JSON response) {
        return RegisterModel.fromJson(response);
      },
    );
  }

  Future<bool> checkPhoneNumberExist({required JSON params}) {
    return _apiService.getDocumentData(
        endpoint: ApiEndpoint.authentication(
            AuthenticationEndpoint.CHECK_PHONE_NUMBER),
        queryParams: params,
        requiresAuthToken: false,
        converter: (JSON response) {
          return response['data'] as bool;
        });
  }

  Future<UserModel> getUserInfo() {
    return _apiService.getDocumentData(
        endpoint: ApiEndpoint.authentication(AuthenticationEndpoint.PROFILE),
        requiresAuthToken: true,
        converter: (JSON response) {
          return UserModel.fromJson(response['data'] as JSON);
        });
  }

  Future<String> sendResetPasswordData({
    required JSON data,
  }) {
    return _apiService.setData<String>(
      endpoint:
          ApiEndpoint.authentication(AuthenticationEndpoint.RESET_PASSWORD),
      data: data,
      requiresAuthToken: false,
      converter: (JSON response) =>
          (response['headers'] as JSON)['message'] as String,
    );
  }

  Future<void> registerNotification({
    required JSON data,
  }) {
    return _apiService.setData<void>(
        endpoint: ApiEndpoint.authentication(
            AuthenticationEndpoint.REGISTER_NOTIFICATION),
        data: data,
        converter: (JSON response) => response.toString());
  }

  Future<String> sendOtpData({required JSON data}) {
    return _apiService.setData<String>(
      endpoint: ApiEndpoint.authentication(AuthenticationEndpoint.VERIFY_OTP),
      data: data,
      requiresAuthToken: false,
      converter: (JSON response) =>
          (response['headers'] as JSON)['message'] as String,
    );
  }
}
