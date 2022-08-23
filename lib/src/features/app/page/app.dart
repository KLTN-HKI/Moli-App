import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:moli_app/l10n/l10n.dart';
import 'package:moli_app/src/dependency_container.dart';
import 'package:moli_app/src/features/app/bloc/bloc.dart';
import 'package:moli_app/src/features/features.dart';

class MoliApp extends StatelessWidget {
  const MoliApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AppBloc>()),
        BlocProvider(create: (_) => getIt<AppSettingsCubit>()),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingsCubit, AppSettingsState>(
      builder: (context, state) {
        return MaterialApp(
          themeMode: state.themeMode,
          theme: AppSettingsCubit.lightTheme,
          darkTheme: AppSettingsCubit.darkTheme,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          locale: state.locale,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const HomePage(),
        );
      },
    );
  }
}
