import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moli_app/features/authentication/presentation/check_user/cubit/phone_cubit.dart';
import 'package:path_provider/path_provider.dart';
import '../app/bloc/bloc.dart';
import '../features/authentication/authentication.dart';
import '../shared/shared.dart';

final GetIt getIt = GetIt.instance;

Future<void> resolveDependencies({
  bool? isAuthenticated,
}) async {
  // API Service
  const String baseUrl =
      String.fromEnvironment('BASE_URL', defaultValue: 'localhost:3000/');

  getIt
    ..registerSingleton<Dio>(Dio(BaseOptions(baseUrl: baseUrl)))
    ..registerSingleton<AuthenticationService>(AuthenticationService())
    ..registerSingleton<DioService>(DioService(
      dioClient: getIt<Dio>(),
      interceptors: <Interceptor>[
        ApiInterceptor(getIt<AuthenticationService>()),
        if (kDebugMode) LoggingInterceptor(),
        RefreshTokenInterceptor(
          dioClient: getIt<Dio>(),
          service: getIt<AuthenticationService>(),
        ),
      ],
    ))
    ..registerSingleton<ApiService>(ApiService(getIt<DioService>()))

    // App System getting
    ..registerSingleton<AppSettingsCubit>(AppSettingsCubit())
    ..registerSingleton<AppConnectCubit>(AppConnectCubit())
    // App Authentication
    ..registerSingleton<AuthenticationBloc>(AuthenticationBloc(
      authenticationService: getIt<AuthenticationService>(),
    ))
    ..registerSingleton<AuthenticationRepository>(
        AuthenticationRepository(apiService: getIt<ApiService>()))
    ..registerSingleton<LoginCubit>(LoginCubit(
        authenticationRepository: getIt<AuthenticationRepository>(),
        authenticationBloc: getIt<AuthenticationBloc>(),
        authenticationService: getIt<AuthenticationService>()))
    ..registerSingleton<PhoneCubit>(PhoneCubit(
        authenticationRepository: getIt<AuthenticationRepository>(),
        authenticationBloc: getIt<AuthenticationBloc>()))
    // App
    ..registerSingleton<AppBloc>(
        AppBloc(authenticationBloc: getIt<AuthenticationBloc>()));
}

Future<void> resolveLocalDataSource() async {
  // Storage Base initialize
  await KeyValueStorageBase.init();
  final Directory appDocumentDirectory =
      await getApplicationDocumentsDirectory();
  // Hive initialize
  await Hive.initFlutter(appDocumentDirectory.path);
  await Hive.openBox('settings');
  await Hive.openBox('onboarding');
}
