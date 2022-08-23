// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppSettingsState {
  ThemeMode get themeMode => throw _privateConstructorUsedError;
  ThemeData get themeData => throw _privateConstructorUsedError;
  Locale get locale => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ThemeMode themeMode, ThemeData themeData, Locale locale)
        settings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ThemeMode themeMode, ThemeData themeData, Locale locale)?
        settings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeMode themeMode, ThemeData themeData, Locale locale)?
        settings,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Settings value) settings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Settings value)? settings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Settings value)? settings,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppSettingsStateCopyWith<AppSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsStateCopyWith<$Res> {
  factory $AppSettingsStateCopyWith(
          AppSettingsState value, $Res Function(AppSettingsState) then) =
      _$AppSettingsStateCopyWithImpl<$Res>;
  $Res call({ThemeMode themeMode, ThemeData themeData, Locale locale});
}

/// @nodoc
class _$AppSettingsStateCopyWithImpl<$Res>
    implements $AppSettingsStateCopyWith<$Res> {
  _$AppSettingsStateCopyWithImpl(this._value, this._then);

  final AppSettingsState _value;
  // ignore: unused_field
  final $Res Function(AppSettingsState) _then;

  @override
  $Res call({
    Object? themeMode = freezed,
    Object? themeData = freezed,
    Object? locale = freezed,
  }) {
    return _then(_value.copyWith(
      themeMode: themeMode == freezed
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      themeData: themeData == freezed
          ? _value.themeData
          : themeData // ignore: cast_nullable_to_non_nullable
              as ThemeData,
      locale: locale == freezed
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc
abstract class _$$_SettingsCopyWith<$Res>
    implements $AppSettingsStateCopyWith<$Res> {
  factory _$$_SettingsCopyWith(
          _$_Settings value, $Res Function(_$_Settings) then) =
      __$$_SettingsCopyWithImpl<$Res>;
  @override
  $Res call({ThemeMode themeMode, ThemeData themeData, Locale locale});
}

/// @nodoc
class __$$_SettingsCopyWithImpl<$Res>
    extends _$AppSettingsStateCopyWithImpl<$Res>
    implements _$$_SettingsCopyWith<$Res> {
  __$$_SettingsCopyWithImpl(
      _$_Settings _value, $Res Function(_$_Settings) _then)
      : super(_value, (v) => _then(v as _$_Settings));

  @override
  _$_Settings get _value => super._value as _$_Settings;

  @override
  $Res call({
    Object? themeMode = freezed,
    Object? themeData = freezed,
    Object? locale = freezed,
  }) {
    return _then(_$_Settings(
      themeMode: themeMode == freezed
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      themeData: themeData == freezed
          ? _value.themeData
          : themeData // ignore: cast_nullable_to_non_nullable
              as ThemeData,
      locale: locale == freezed
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _$_Settings implements _Settings {
  const _$_Settings(
      {required this.themeMode, required this.themeData, required this.locale});

  @override
  final ThemeMode themeMode;
  @override
  final ThemeData themeData;
  @override
  final Locale locale;

  @override
  String toString() {
    return 'AppSettingsState.settings(themeMode: $themeMode, themeData: $themeData, locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Settings &&
            const DeepCollectionEquality().equals(other.themeMode, themeMode) &&
            const DeepCollectionEquality().equals(other.themeData, themeData) &&
            const DeepCollectionEquality().equals(other.locale, locale));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(themeMode),
      const DeepCollectionEquality().hash(themeData),
      const DeepCollectionEquality().hash(locale));

  @JsonKey(ignore: true)
  @override
  _$$_SettingsCopyWith<_$_Settings> get copyWith =>
      __$$_SettingsCopyWithImpl<_$_Settings>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ThemeMode themeMode, ThemeData themeData, Locale locale)
        settings,
  }) {
    return settings(themeMode, themeData, locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ThemeMode themeMode, ThemeData themeData, Locale locale)?
        settings,
  }) {
    return settings?.call(themeMode, themeData, locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeMode themeMode, ThemeData themeData, Locale locale)?
        settings,
    required TResult orElse(),
  }) {
    if (settings != null) {
      return settings(themeMode, themeData, locale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Settings value) settings,
  }) {
    return settings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Settings value)? settings,
  }) {
    return settings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Settings value)? settings,
    required TResult orElse(),
  }) {
    if (settings != null) {
      return settings(this);
    }
    return orElse();
  }
}

abstract class _Settings implements AppSettingsState {
  const factory _Settings(
      {required final ThemeMode themeMode,
      required final ThemeData themeData,
      required final Locale locale}) = _$_Settings;

  @override
  ThemeMode get themeMode;
  @override
  ThemeData get themeData;
  @override
  Locale get locale;
  @override
  @JsonKey(ignore: true)
  _$$_SettingsCopyWith<_$_Settings> get copyWith =>
      throw _privateConstructorUsedError;
}
