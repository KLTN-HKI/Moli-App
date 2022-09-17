import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dependency_container.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log(
      name: 'Bloc',
      '\x1B[36monChange(${bloc.runtimeType}, $change)',
    );
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log(
      name: 'Bloc',
      error: error,
      stackTrace: stackTrace,
      '\x1B[31monError(${bloc.runtimeType})',
    );
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  /*  FlutterError.onError = (FlutterErrorDetails details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  }; */
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  if (kDebugMode) {
    Bloc.observer = AppBlocObserver();
  }
  await resolveLocalDataSource();
  await resolveDependencies();

  await runZonedGuarded(
    () async => runApp(await builder()),
    (Object error, StackTrace stackTrace) =>
        log(error.toString(), stackTrace: stackTrace),
  );
}
