import 'dart:async';
import 'dart:developer' as dev;

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:moli_app/shared/services/firebase/firebase_authentication.dart';
import 'package:moli_app/shared/services/service.dart';
import 'dependency_container.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    dev.log(
      name: '${bloc.runtimeType}',
      '\x1B[37m${(change.currentState as Object).runtimeType} \u{2771}\u{27A4} ${(change.nextState as Object).runtimeType}',
    );
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    dev.log(
      name: '${bloc.runtimeType}',
      '\x1B[31mAPP BLOC OBSERVER',
      error: error,
    );
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      SystemChrome.setPreferredOrientations(<DeviceOrientation>[
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ]);

      final Widget app = await builder();

      await MoliCrashlytics.initialize();
      await MoliRemoteConfig.initialize();
      await MoliMessaging.initialize();
      await MoliDynamicLink.initialize();
      await MoliCloudAuthentication.initialize();

      if (kDebugMode) {
        Bloc.observer = AppBlocObserver();
      }
      await KeyValueStorageBase.initialize();
      await resolveDependencies();

      runApp(app);
    },
    MoliCrashlytics.instance.recordError,
  );
}
