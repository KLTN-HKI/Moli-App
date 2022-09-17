// ignore_for_file: non_constant_identifier_names
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

//Helpers
import '../../common/common.dart';

part 'network_exception.freezed.dart';

@freezed
class NetworkException with _$NetworkException implements Exception {
  const NetworkException._() : super();

  const factory NetworkException.FormatException({
    required String name,
    required String message,
  }) = _FormatException;

  const factory NetworkException.FetchDataException({
    required String name,
    required String message,
  }) = _FetchDataException;

  const factory NetworkException.ApiException({
    required String name,
    required String message,
  }) = _ApiException;

  const factory NetworkException.TokenExpiredException({
    required String name,
    required String message,
  }) = _TokenExpiredException;

  const factory NetworkException.UnrecognizedException({
    required String name,
    required String message,
  }) = _UnrecognizedException;

  const factory NetworkException.CancelException({
    required String name,
    required String message,
  }) = _CancelException;

  const factory NetworkException.ConnectTimeoutException({
    required String name,
    required String message,
  }) = _ConnectTimeoutException;

  const factory NetworkException.ReceiveTimeoutException({
    required String name,
    required String message,
  }) = _ReceiveTimeoutException;

  const factory NetworkException.SendTimeoutException({
    required String name,
    required String message,
  }) = _SendTimeoutException;

  static NetworkException getDioException(Exception error) {
    try {
      if (error is DioError) {
        switch (error.type) {
          case DioErrorType.cancel:
            return const NetworkException.CancelException(
              name: ExceptionConstants.CancelException,
              message: 'Request cancelled prematurely',
            );
          case DioErrorType.connectTimeout:
            return const NetworkException.ConnectTimeoutException(
              name: ExceptionConstants.ConnectTimeoutException,
              message: 'Connection not established',
            );
          case DioErrorType.sendTimeout:
            return const NetworkException.SendTimeoutException(
              name: ExceptionConstants.SendTimeoutException,
              message: 'Failed to send',
            );
          case DioErrorType.receiveTimeout:
            return const NetworkException.ReceiveTimeoutException(
              name: ExceptionConstants.ReceiveTimeoutException,
              message: 'Failed to receive',
            );
          case DioErrorType.response:
          case DioErrorType.other:
            if (error.message.contains(ExceptionConstants.SocketException)) {
              return const NetworkException.FetchDataException(
                name: ExceptionConstants.FetchDataException,
                message: 'No internet connectivity',
              );
            }

            String? message;
            if (error.response?.data is JSON) {
              final JSON data = error.response?.data as JSON;
              if (data['errors'] is List<QueryParams>) {
                message =
                    (data['errors'] as List<QueryParams>).first['message'];
              }
            }

            switch (message) {
              case 'Your session expire, please login again':
                return NetworkException.TokenExpiredException(
                  name: ExceptionConstants.TokenExpiredException,
                  message: message ?? error.message,
                );
              default:
                return NetworkException.ApiException(
                  name: error.type.toString(),
                  message: message ?? error.message,
                );
            }
        }
      } else {
        return const NetworkException.UnrecognizedException(
          name: ExceptionConstants.UnrecognizedException,
          message: 'Error unrecognized',
        );
      }
    } on FormatException catch (e) {
      return NetworkException.FormatException(
        name: ExceptionConstants.FormatException,
        message: e.message,
      );
    } on Exception catch (_) {
      return const NetworkException.UnrecognizedException(
        name: ExceptionConstants.UnrecognizedException,
        message: 'Error unrecognized',
      );
    }
  }
}
