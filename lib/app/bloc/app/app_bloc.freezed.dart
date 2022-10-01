// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppEvent {
  AppState get state => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppState state) updateState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AppState state)? updateState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppState state)? updateState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateState value) updateState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateState value)? updateState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateState value)? updateState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppEventCopyWith<AppEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEventCopyWith<$Res> {
  factory $AppEventCopyWith(AppEvent value, $Res Function(AppEvent) then) =
      _$AppEventCopyWithImpl<$Res>;
  $Res call({AppState state});

  $AppStateCopyWith<$Res> get state;
}

/// @nodoc
class _$AppEventCopyWithImpl<$Res> implements $AppEventCopyWith<$Res> {
  _$AppEventCopyWithImpl(this._value, this._then);

  final AppEvent _value;
  // ignore: unused_field
  final $Res Function(AppEvent) _then;

  @override
  $Res call({
    Object? state = freezed,
  }) {
    return _then(_value.copyWith(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as AppState,
    ));
  }

  @override
  $AppStateCopyWith<$Res> get state {
    return $AppStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc
abstract class _$$_UpdateStateCopyWith<$Res>
    implements $AppEventCopyWith<$Res> {
  factory _$$_UpdateStateCopyWith(
          _$_UpdateState value, $Res Function(_$_UpdateState) then) =
      __$$_UpdateStateCopyWithImpl<$Res>;
  @override
  $Res call({AppState state});

  @override
  $AppStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$_UpdateStateCopyWithImpl<$Res> extends _$AppEventCopyWithImpl<$Res>
    implements _$$_UpdateStateCopyWith<$Res> {
  __$$_UpdateStateCopyWithImpl(
      _$_UpdateState _value, $Res Function(_$_UpdateState) _then)
      : super(_value, (v) => _then(v as _$_UpdateState));

  @override
  _$_UpdateState get _value => super._value as _$_UpdateState;

  @override
  $Res call({
    Object? state = freezed,
  }) {
    return _then(_$_UpdateState(
      state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as AppState,
    ));
  }
}

/// @nodoc

class _$_UpdateState implements _UpdateState {
  const _$_UpdateState(this.state);

  @override
  final AppState state;

  @override
  String toString() {
    return 'AppEvent.updateState(state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateState &&
            const DeepCollectionEquality().equals(other.state, state));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(state));

  @JsonKey(ignore: true)
  @override
  _$$_UpdateStateCopyWith<_$_UpdateState> get copyWith =>
      __$$_UpdateStateCopyWithImpl<_$_UpdateState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppState state) updateState,
  }) {
    return updateState(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AppState state)? updateState,
  }) {
    return updateState?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppState state)? updateState,
    required TResult orElse(),
  }) {
    if (updateState != null) {
      return updateState(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateState value) updateState,
  }) {
    return updateState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UpdateState value)? updateState,
  }) {
    return updateState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateState value)? updateState,
    required TResult orElse(),
  }) {
    if (updateState != null) {
      return updateState(this);
    }
    return orElse();
  }
}

abstract class _UpdateState implements AppEvent {
  const factory _UpdateState(final AppState state) = _$_UpdateState;

  @override
  AppState get state;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateStateCopyWith<_$_UpdateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() home,
    required TResult Function() login,
    required TResult Function() firstTimeLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? home,
    TResult Function()? login,
    TResult Function()? firstTimeLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? home,
    TResult Function()? login,
    TResult Function()? firstTimeLogin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Home value) home,
    required TResult Function(_Login value) login,
    required TResult Function(_FirstTimeLogin value) firstTimeLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Home value)? home,
    TResult Function(_Login value)? login,
    TResult Function(_FirstTimeLogin value)? firstTimeLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Home value)? home,
    TResult Function(_Login value)? login,
    TResult Function(_FirstTimeLogin value)? firstTimeLogin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'AppState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() home,
    required TResult Function() login,
    required TResult Function() firstTimeLogin,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? home,
    TResult Function()? login,
    TResult Function()? firstTimeLogin,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? home,
    TResult Function()? login,
    TResult Function()? firstTimeLogin,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Home value) home,
    required TResult Function(_Login value) login,
    required TResult Function(_FirstTimeLogin value) firstTimeLogin,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Home value)? home,
    TResult Function(_Login value)? login,
    TResult Function(_FirstTimeLogin value)? firstTimeLogin,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Home value)? home,
    TResult Function(_Login value)? login,
    TResult Function(_FirstTimeLogin value)? firstTimeLogin,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AppState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_HomeCopyWith<$Res> {
  factory _$$_HomeCopyWith(_$_Home value, $Res Function(_$_Home) then) =
      __$$_HomeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_HomeCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$$_HomeCopyWith<$Res> {
  __$$_HomeCopyWithImpl(_$_Home _value, $Res Function(_$_Home) _then)
      : super(_value, (v) => _then(v as _$_Home));

  @override
  _$_Home get _value => super._value as _$_Home;
}

/// @nodoc

class _$_Home implements _Home {
  const _$_Home();

  @override
  String toString() {
    return 'AppState.home()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Home);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() home,
    required TResult Function() login,
    required TResult Function() firstTimeLogin,
  }) {
    return home();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? home,
    TResult Function()? login,
    TResult Function()? firstTimeLogin,
  }) {
    return home?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? home,
    TResult Function()? login,
    TResult Function()? firstTimeLogin,
    required TResult orElse(),
  }) {
    if (home != null) {
      return home();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Home value) home,
    required TResult Function(_Login value) login,
    required TResult Function(_FirstTimeLogin value) firstTimeLogin,
  }) {
    return home(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Home value)? home,
    TResult Function(_Login value)? login,
    TResult Function(_FirstTimeLogin value)? firstTimeLogin,
  }) {
    return home?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Home value)? home,
    TResult Function(_Login value)? login,
    TResult Function(_FirstTimeLogin value)? firstTimeLogin,
    required TResult orElse(),
  }) {
    if (home != null) {
      return home(this);
    }
    return orElse();
  }
}

abstract class _Home implements AppState {
  const factory _Home() = _$_Home;
}

/// @nodoc
abstract class _$$_LoginCopyWith<$Res> {
  factory _$$_LoginCopyWith(_$_Login value, $Res Function(_$_Login) then) =
      __$$_LoginCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoginCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$$_LoginCopyWith<$Res> {
  __$$_LoginCopyWithImpl(_$_Login _value, $Res Function(_$_Login) _then)
      : super(_value, (v) => _then(v as _$_Login));

  @override
  _$_Login get _value => super._value as _$_Login;
}

/// @nodoc

class _$_Login implements _Login {
  const _$_Login();

  @override
  String toString() {
    return 'AppState.login()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Login);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() home,
    required TResult Function() login,
    required TResult Function() firstTimeLogin,
  }) {
    return login();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? home,
    TResult Function()? login,
    TResult Function()? firstTimeLogin,
  }) {
    return login?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? home,
    TResult Function()? login,
    TResult Function()? firstTimeLogin,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Home value) home,
    required TResult Function(_Login value) login,
    required TResult Function(_FirstTimeLogin value) firstTimeLogin,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Home value)? home,
    TResult Function(_Login value)? login,
    TResult Function(_FirstTimeLogin value)? firstTimeLogin,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Home value)? home,
    TResult Function(_Login value)? login,
    TResult Function(_FirstTimeLogin value)? firstTimeLogin,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _Login implements AppState {
  const factory _Login() = _$_Login;
}

/// @nodoc
abstract class _$$_FirstTimeLoginCopyWith<$Res> {
  factory _$$_FirstTimeLoginCopyWith(
          _$_FirstTimeLogin value, $Res Function(_$_FirstTimeLogin) then) =
      __$$_FirstTimeLoginCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FirstTimeLoginCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$$_FirstTimeLoginCopyWith<$Res> {
  __$$_FirstTimeLoginCopyWithImpl(
      _$_FirstTimeLogin _value, $Res Function(_$_FirstTimeLogin) _then)
      : super(_value, (v) => _then(v as _$_FirstTimeLogin));

  @override
  _$_FirstTimeLogin get _value => super._value as _$_FirstTimeLogin;
}

/// @nodoc

class _$_FirstTimeLogin implements _FirstTimeLogin {
  const _$_FirstTimeLogin();

  @override
  String toString() {
    return 'AppState.firstTimeLogin()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_FirstTimeLogin);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() home,
    required TResult Function() login,
    required TResult Function() firstTimeLogin,
  }) {
    return firstTimeLogin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? home,
    TResult Function()? login,
    TResult Function()? firstTimeLogin,
  }) {
    return firstTimeLogin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? home,
    TResult Function()? login,
    TResult Function()? firstTimeLogin,
    required TResult orElse(),
  }) {
    if (firstTimeLogin != null) {
      return firstTimeLogin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Home value) home,
    required TResult Function(_Login value) login,
    required TResult Function(_FirstTimeLogin value) firstTimeLogin,
  }) {
    return firstTimeLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Home value)? home,
    TResult Function(_Login value)? login,
    TResult Function(_FirstTimeLogin value)? firstTimeLogin,
  }) {
    return firstTimeLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Home value)? home,
    TResult Function(_Login value)? login,
    TResult Function(_FirstTimeLogin value)? firstTimeLogin,
    required TResult orElse(),
  }) {
    if (firstTimeLogin != null) {
      return firstTimeLogin(this);
    }
    return orElse();
  }
}

abstract class _FirstTimeLogin implements AppState {
  const factory _FirstTimeLogin() = _$_FirstTimeLogin;
}
