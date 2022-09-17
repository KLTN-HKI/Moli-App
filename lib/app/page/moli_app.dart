import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:moli_app/app/bloc/bloc.dart';
import 'package:moli_app/app/router/auth_guard.dart';
import 'package:moli_app/app/router/router.dart';
import 'package:moli_app/config/config.dart';
import 'package:moli_app/features/features.dart';
import 'package:moli_app/shared/shared.dart';

class MoliApp extends StatelessWidget {
  MoliApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  // final AppRouter _appRouter = AppRouter(authGuard: AuthGuard());
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<AppBloc>(create: (_) => getIt()),
        BlocProvider<AppSettingsCubit>(create: (_) => getIt()),
        BlocProvider<AuthenticationBloc>(create: (_) => getIt()),
        BlocProvider<AppConnectCubit>(create: (_) => getIt()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (BuildContext context, Widget? child) {
          return BlocBuilder<AppBloc, AppState>(
            builder: (BuildContext context, AppState appState) {
              return BlocBuilder<AppSettingsCubit, AppSettingsState>(
                builder: (BuildContext context, AppSettingsState state) {
                  return MaterialApp.router(
                    key: navigatorKey,
                    debugShowCheckedModeBanner: false,
                    themeMode: state.themeMode,
                    theme: AppSettingsCubit.lightTheme,
                    darkTheme: AppSettingsCubit.darkTheme,
                    routeInformationParser: _appRouter.defaultRouteParser(),
                    /* routerDelegate: AutoRouterDelegate.declarative(_appRouter,
                        routes: (_) => appState.maybeWhen(
                            // initial: () => [const DashboardRoute()],
                            authenticated: () => [const DashboardRoute()],
                            unauthenticated: () => [const LoginRoute()],
                            orElse: () => [])), */
                    routerDelegate: _appRouter.delegate(),
                    locale: state.locale,
                    supportedLocales: AppLocalizations.supportedLocales,
                    localizationsDelegates: const <
                        LocalizationsDelegate<dynamic>>[
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    builder: (BuildContext context, Widget? child) {
                      return BlocListener<AppConnectCubit, AppConnectState>(
                        listener:
                            (BuildContext context, AppConnectState state) {
                          // state.when(
                          //   connected: () {
                          //     context.scaffoldMessenger.showSnackBar(const SnackBar(
                          //       key: Key('Internet Connected'),
                          //       content: Text('Internet Connected'),
                          //     ));
                          //   },
                          //   disconnected: () {
                          //     context.scaffoldMessenger.showSnackBar(const SnackBar(
                          //       key: Key('Internet Lost'),
                          //       content: Text('Internet Lost'),
                          //     ));
                          //   },
                          // );
                        },
                        child: child,
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
