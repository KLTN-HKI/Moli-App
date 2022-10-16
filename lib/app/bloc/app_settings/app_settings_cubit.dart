import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_shared/moli_shared.dart';

part 'app_settings_cubit.freezed.dart';
part 'app_settings_state.dart';

class AppSettingsCubit extends Cubit<AppSettingsState> {
  AppSettingsCubit()
      : super(AppSettingsState.settings(
          themeMode: ThemeMode.light,
          themeData: lightTheme,
          locale: const Locale('vi', 'VN'),
        )) {
// Get local data
    // final Locale locale = SchedulerBinding.instance.window.locale;

    // Change settings
    changeThemeMode(ThemeMode.light);
    changeLanguage('vi');
    // changeLanguage(locale.languageCode);

    // Listen user change system settings change
    WidgetsBinding.instance.window.onPlatformBrightnessChanged = () {
      if (state.themeMode == ThemeMode.system) {
        changeThemeMode(state.themeMode);
      }
    };
  }

  static final ThemeData lightTheme = MoliTheme.lighTheme;
  static final ThemeData darkTheme = MoliTheme.darkTheme;
  static const Locale viLanguage = Locale('vi', 'VN');
  static const Locale enLanguage = Locale('en', 'US');

  void changeThemeMode(ThemeMode themeMode) {
    switch (state.themeMode) {
      case ThemeMode.light:
        emit(state.copyWith(themeMode: themeMode, themeData: lightTheme));
        break;
      case ThemeMode.dark:
        emit(state.copyWith(themeMode: themeMode, themeData: darkTheme));
        break;
      case ThemeMode.system:
        final Brightness brightness =
            SchedulerBinding.instance.window.platformBrightness;
        emit(state.copyWith(
            themeMode: themeMode,
            themeData: brightness == Brightness.dark ? darkTheme : lightTheme));
        break;
    }
  }

  void changeLanguage(String languageCode) {
    emit(state.copyWith(
      locale: languageCode == 'vi' ? viLanguage : enLanguage,
    ));
  }
}
