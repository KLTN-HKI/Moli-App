import '../../../shared/shared.dart';
import '../domain/response/response.dart';
import 'authentication_endpoint.dart';

class AuthenticationRepository {
  AuthenticationRepository({required ApiService apiService})
      : _apiService = apiService;

  final ApiService _apiService;

  Future<LoginModel> sendLoginData({required JSON data}) {
    return _apiService.setData<LoginModel>(
      endpoint: AuthenticationEndpoint.auth(AuthEndpoint.LOGIN),
      data: <String, dynamic>{}..addAll(data),
      requiresAuthToken: false,
      converter: (JSON response) {
        return LoginModel.fromJson(response);
      },
    );
  }

  Future<LoginModel> sendRegisterData({required JSON data}) {
    return _apiService.setData<LoginModel>(
      endpoint: AuthenticationEndpoint.auth(AuthEndpoint.REGISTER),
      data: data,
      requiresAuthToken: false,
      converter: (JSON response) {
        return LoginModel.fromJson(response);
      },
    );
  }

  Future<bool> checkPhoneNumberExist({required JSON params}) {
    return _apiService.getDocumentData(
        endpoint: AuthenticationEndpoint.auth(AuthEndpoint.CHECK_PHONE_NUMBER),
        queryParams: params,
        requiresAuthToken: false,
        converter: (JSON response) {
          return response['data'] as bool;
        });
  }

  Future<UserModel> getUserInfo() {
    return _apiService.getDocumentData(
        endpoint: AuthenticationEndpoint.auth(AuthEndpoint.PROFILE),
        requiresAuthToken: true,
        converter: (JSON response) {
          return UserModel.fromJson(response);
        });
  }

  Future<String> sendResetPasswordData({
    required JSON data,
  }) {
    return _apiService.setData<String>(
      endpoint: AuthenticationEndpoint.auth(AuthEndpoint.RESET_PASSWORD),
      data: data,
      requiresAuthToken: false,
      converter: (JSON response) =>
          (response['headers'] as JSON)['message'] as String,
    );
  }

  Future<String> sendOtpData({required JSON data}) {
    return _apiService.setData<String>(
      endpoint: AuthenticationEndpoint.auth(AuthEndpoint.VERIFY_OTP),
      data: data,
      requiresAuthToken: false,
      converter: (JSON response) =>
          (response['headers'] as JSON)['message'] as String,
    );
  }
}
