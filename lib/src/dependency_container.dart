import 'package:get_it/get_it.dart';
import 'package:moli_app/src/features/app/bloc/bloc.dart';

final getIt = GetIt.instance;

Future<void> resolveDependencies({
  bool? isAuthenticated,
}) async {
  // API Service
  /* const baseUrl =
      String.fromEnvironment('BASE_URL', defaultValue: 'localhost:3000/'); */

  // System getting
  getIt
    ..registerSingleton<AppSettingsCubit>(AppSettingsCubit())

    // App
    ..registerSingleton<AppBloc>(
      AppBloc(
        appSettingsCubit: getIt<AppSettingsCubit>(),
      ),
    );
}

Future<void> resolveLocalDataSource() async {}
