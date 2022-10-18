import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:moli_app/app/bloc/bloc.dart';
import 'package:moli_app/config/config.dart';
import 'package:moli_app/features/appointment/presentation/bloc/appointment/appointment_cubit.dart';
import 'package:moli_app/features/authentication/presentation/check_user/cubit/phone_cubit.dart';
import 'package:moli_app/features/authentication/presentation/otp/cubit/otp_cubit.dart';
import 'package:moli_app/features/authentication/presentation/register/cubit/register_cubit.dart';
import 'package:moli_app/features/features.dart';
import 'package:moli_app/features/notification/application/bloc/notification_bloc.dart';
import 'package:moli_app/features/notification/application/notification_service.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../features/appointment/presentation/bloc/appointment_list/appointment_list_cubit.dart';
import '../../router/routing.dart';

class MoliApp extends StatelessWidget {
  const MoliApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<AppBloc>(create: (_) => AppBloc(getIt())),
        BlocProvider<AppSettingsCubit>(create: (_) => AppSettingsCubit()),
        BlocProvider<AppConnectCubit>(create: (_) => AppConnectCubit()),
        BlocProvider<AuthenticationBloc>(create: (_) => getIt()),
        BlocProvider<NotificationBloc>(create: (_) => getIt()),
        BlocProvider<PhoneCubit>(create: (_) => PhoneCubit()),
        BlocProvider<OtpCubit>(create: (_) => OtpCubit()),
        BlocProvider<RegisterCubit>(create: (_) => RegisterCubit(LoginCubit())),
        BlocProvider<AppointmentListCubit>(
            create: (_) => AppointmentListCubit()),
        BlocProvider<AppointmentCubit>(create: (_) => AppointmentCubit()),
      ],
      child: const MoliView(),
    );
  }
}

class MoliView extends StatefulWidget {
  const MoliView({super.key});

  @override
  State<MoliView> createState() => _MoliViewState();
}

class _MoliViewState extends State<MoliView> {
  late GoRouter _appRouter;

  @override
  void initState() {
    super.initState();
    NotificationService.initialize();
  }

  @override
  void didChangeDependencies() {
    context.read<AuthenticationBloc>().add(const AuthenticationEvent.init());

    _appRouter = routing(context, null);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingsCubit, AppSettingsState>(
      builder: (BuildContext context, AppSettingsState state) {
        return MaterialApp.router(
          routerConfig: _appRouter,
          debugShowCheckedModeBanner: false,
          themeMode: state.themeMode,
          theme: AppSettingsCubit.lightTheme,
          darkTheme: AppSettingsCubit.darkTheme,
          locale: state.locale,
          supportedLocales: AppLanguage.delegate.supportedLocales,
          localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            AppLanguage.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          builder: (BuildContext context, Widget? child) {
            return BlocListener<AppConnectCubit, AppConnectState>(
              listener: (BuildContext context, AppConnectState state) {
                // state.when(connected: () {
                //   context.scaffoldMessenger.showSnackBar(const SnackBar(
                //     key: Key('Internet Connected'),
                //     content: Text('Internet Connected'),
                //   ));
                // }, disconnected: () {
                //   context.scaffoldMessenger.showSnackBar(const SnackBar(
                //     key: Key('Internet Lost'),
                //     content: Text('Internet Lost'),
                //   ));
                // });
              },
              child: child,
            );
          },
        );
      },
    );
  }
}
