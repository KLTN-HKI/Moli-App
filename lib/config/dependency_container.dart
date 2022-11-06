import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:moli_app/features/appointment/data/appointment_repository_api.dart';
import 'package:moli_app/features/doctor/data/doctor_repository_api.dart';
import 'package:moli_shared/moli_shared.dart';

import '../features/appointment/presentation/bloc/patient_appointment/patient_appointment_bloc.dart';
import '../features/authentication/authentication.dart';
import '../features/hospital/data/hospital_repository_api.dart';
import '../features/notification/application/bloc/notification_bloc.dart';
import '../features/notification/data/notification_repository_api.dart';
import '../features/notification/data/notification_repository_local.dart';

final GetIt getIt = GetIt.instance;

Future<void> resolveDependencies({
  bool? isAuthenticated,
}) async {
  // API Service

  getIt
    ..registerSingleton<Dio>(Dio(BaseOptions(
        baseUrl: const String.fromEnvironment('BASE_URL',
            defaultValue: 'localhost:3000/'),
        contentType: 'application/json')))
    ..registerSingleton<AuthenticationService>(AuthenticationService())
    ..registerSingleton<DioService>(DioService(
      dioClient: getIt<Dio>(),
      interceptors: <Interceptor>[
        TokenInterceptor(getIt<AuthenticationService>()),
        if (kDebugMode) LoggingInterceptor(),
        RefreshTokenInterceptor(getIt<AuthenticationService>()),
      ],
    ))
    ..registerSingleton<ApiService>(ApiService(getIt<DioService>()))

    // Authentication
    ..registerSingleton<AuthenticationRepository>(
        AuthenticationRepository(apiService: getIt<ApiService>()))
    ..registerSingleton<AuthenticationBloc>(AuthenticationBloc(getIt()))

    /// Notification
    ..registerSingleton<NotificationBloc>(NotificationBloc())
    ..registerSingleton<NotificationRepositoryApi>(NotificationRepositoryApi())
    ..registerSingletonAsync(NotificationRepositoryLocal.initialize)

    ///Hospital
    ..registerSingleton<HospitalRepositoryApi>(HospitalRepositoryApi())

    ///Doctor
    ..registerSingleton<DoctorRepositoryApi>(DoctorRepositoryApi())
    ..registerSingleton<AppointmentRepositoryApi>(AppointmentRepositoryApi())

    ///
    ..registerSingleton<PatientAppointmentBloc>(
        PatientAppointmentBloc(getIt()));
}
