// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'authentication_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthenticationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(UserModel user) loggedIn,
    required TResult Function() loggedOut,
    required TResult Function(String token) saveToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(UserModel user)? loggedIn,
    TResult Function()? loggedOut,
    TResult Function(String token)? saveToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(UserModel user)? loggedIn,
    TResult Function()? loggedOut,
    TResult Function(String token)? saveToken,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) init,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_SaveToken value) saveToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? init,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_SaveToken value)? saveToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? init,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_SaveToken value)? saveToken,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationEventCopyWith<$Res> {
  factory $AuthenticationEventCopyWith(
          AuthenticationEvent value, $Res Function(AuthenticationEvent) then) =
      _$AuthenticationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticationEventCopyWithImpl<$Res>
    implements $AuthenticationEventCopyWith<$Res> {
  _$AuthenticationEventCopyWithImpl(this._value, this._then);

  final AuthenticationEvent _value;
  // ignore: unused_field
  final $Res Function(AuthenticationEvent) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
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
    return 'AuthenticationEvent.init()';
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
    required TResult Function() init,
    required TResult Function(UserModel user) loggedIn,
    required TResult Function() loggedOut,
    required TResult Function(String token) saveToken,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(UserModel user)? loggedIn,
    TResult Function()? loggedOut,
    TResult Function(String token)? saveToken,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(UserModel user)? loggedIn,
    TResult Function()? loggedOut,
    TResult Function(String token)? saveToken,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) init,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_SaveToken value) saveToken,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? init,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_SaveToken value)? saveToken,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? init,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_SaveToken value)? saveToken,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthenticationEvent {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoggedInCopyWith<$Res> {
  factory _$$_LoggedInCopyWith(
          _$_LoggedIn value, $Res Function(_$_LoggedIn) then) =
      __$$_LoggedInCopyWithImpl<$Res>;
  $Res call({UserModel user});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$_LoggedInCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements _$$_LoggedInCopyWith<$Res> {
  __$$_LoggedInCopyWithImpl(
      _$_LoggedIn _value, $Res Function(_$_LoggedIn) _then)
      : super(_value, (v) => _then(v as _$_LoggedIn));

  @override
  _$_LoggedIn get _value => super._value as _$_LoggedIn;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$_LoggedIn(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }

  @override
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_LoggedIn implements _LoggedIn {
  const _$_LoggedIn(this.user);

  @override
  final UserModel user;

  @override
  String toString() {
    return 'AuthenticationEvent.loggedIn(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoggedIn &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$_LoggedInCopyWith<_$_LoggedIn> get copyWith =>
      __$$_LoggedInCopyWithImpl<_$_LoggedIn>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(UserModel user) loggedIn,
    required TResult Function() loggedOut,
    required TResult Function(String token) saveToken,
  }) {
    return loggedIn(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(UserModel user)? loggedIn,
    TResult Function()? loggedOut,
    TResult Function(String token)? saveToken,
  }) {
    return loggedIn?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(UserModel user)? loggedIn,
    TResult Function()? loggedOut,
    TResult Function(String token)? saveToken,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) init,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_SaveToken value) saveToken,
  }) {
    return loggedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? init,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_SaveToken value)? saveToken,
  }) {
    return loggedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? init,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_SaveToken value)? saveToken,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(this);
    }
    return orElse();
  }
}

abstract class _LoggedIn implements AuthenticationEvent {
  const factory _LoggedIn(final UserModel user) = _$_LoggedIn;

  UserModel get user;
  @JsonKey(ignore: true)
  _$$_LoggedInCopyWith<_$_LoggedIn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoggedOutCopyWith<$Res> {
  factory _$$_LoggedOutCopyWith(
          _$_LoggedOut value, $Res Function(_$_LoggedOut) then) =
      __$$_LoggedOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoggedOutCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements _$$_LoggedOutCopyWith<$Res> {
  __$$_LoggedOutCopyWithImpl(
      _$_LoggedOut _value, $Res Function(_$_LoggedOut) _then)
      : super(_value, (v) => _then(v as _$_LoggedOut));

  @override
  _$_LoggedOut get _value => super._value as _$_LoggedOut;
}

/// @nodoc

class _$_LoggedOut implements _LoggedOut {
  const _$_LoggedOut();

  @override
  String toString() {
    return 'AuthenticationEvent.loggedOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoggedOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(UserModel user) loggedIn,
    required TResult Function() loggedOut,
    required TResult Function(String token) saveToken,
  }) {
    return loggedOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(UserModel user)? loggedIn,
    TResult Function()? loggedOut,
    TResult Function(String token)? saveToken,
  }) {
    return loggedOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(UserModel user)? loggedIn,
    TResult Function()? loggedOut,
    TResult Function(String token)? saveToken,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) init,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_SaveToken value) saveToken,
  }) {
    return loggedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? init,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_SaveToken value)? saveToken,
  }) {
    return loggedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? init,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_SaveToken value)? saveToken,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut(this);
    }
    return orElse();
  }
}

abstract class _LoggedOut implements AuthenticationEvent {
  const factory _LoggedOut() = _$_LoggedOut;
}

/// @nodoc
abstract class _$$_SaveTokenCopyWith<$Res> {
  factory _$$_SaveTokenCopyWith(
          _$_SaveToken value, $Res Function(_$_SaveToken) then) =
      __$$_SaveTokenCopyWithImpl<$Res>;
  $Res call({String token});
}

/// @nodoc
class __$$_SaveTokenCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements _$$_SaveTokenCopyWith<$Res> {
  __$$_SaveTokenCopyWithImpl(
      _$_SaveToken _value, $Res Function(_$_SaveToken) _then)
      : super(_value, (v) => _then(v as _$_SaveToken));

  @override
  _$_SaveToken get _value => super._value as _$_SaveToken;

  @override
  $Res call({
    Object? token = freezed,
  }) {
    return _then(_$_SaveToken(
      token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SaveToken implements _SaveToken {
  const _$_SaveToken(this.token);

  @override
  final String token;

  @override
  String toString() {
    return 'AuthenticationEvent.saveToken(token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SaveToken &&
            const DeepCollectionEquality().equals(other.token, token));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(token));

  @JsonKey(ignore: true)
  @override
  _$$_SaveTokenCopyWith<_$_SaveToken> get copyWith =>
      __$$_SaveTokenCopyWithImpl<_$_SaveToken>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(UserModel user) loggedIn,
    required TResult Function() loggedOut,
    required TResult Function(String token) saveToken,
  }) {
    return saveToken(token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(UserModel user)? loggedIn,
    TResult Function()? loggedOut,
    TResult Function(String token)? saveToken,
  }) {
    return saveToken?.call(token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(UserModel user)? loggedIn,
    TResult Function()? loggedOut,
    TResult Function(String token)? saveToken,
    required TResult orElse(),
  }) {
    if (saveToken != null) {
      return saveToken(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) init,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_SaveToken value) saveToken,
  }) {
    return saveToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? init,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_SaveToken value)? saveToken,
  }) {
    return saveToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? init,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_SaveToken value)? saveToken,
    required TResult orElse(),
  }) {
    if (saveToken != null) {
      return saveToken(this);
    }
    return orElse();
  }
}

abstract class _SaveToken implements AuthenticationEvent {
  const factory _SaveToken(final String token) = _$_SaveToken;

  String get token;
  @JsonKey(ignore: true)
  _$$_SaveTokenCopyWith<_$_SaveToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthenticationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() authenticating,
    required TResult Function(UserModel user) authenticated,
    required TResult Function() firstTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? firstTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? firstTime,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UNAUTHENTICATED value) unauthenticated,
    required TResult Function(AUTHENTICATING value) authenticating,
    required TResult Function(AUTHENTICATED value) authenticated,
    required TResult Function(FIRSTTIME value) firstTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UNAUTHENTICATED value)? unauthenticated,
    TResult Function(AUTHENTICATING value)? authenticating,
    TResult Function(AUTHENTICATED value)? authenticated,
    TResult Function(FIRSTTIME value)? firstTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UNAUTHENTICATED value)? unauthenticated,
    TResult Function(AUTHENTICATING value)? authenticating,
    TResult Function(AUTHENTICATED value)? authenticated,
    TResult Function(FIRSTTIME value)? firstTime,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  final AuthenticationState _value;
  // ignore: unused_field
  final $Res Function(AuthenticationState) _then;
}

/// @nodoc
abstract class _$$UNAUTHENTICATEDCopyWith<$Res> {
  factory _$$UNAUTHENTICATEDCopyWith(
          _$UNAUTHENTICATED value, $Res Function(_$UNAUTHENTICATED) then) =
      __$$UNAUTHENTICATEDCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UNAUTHENTICATEDCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$$UNAUTHENTICATEDCopyWith<$Res> {
  __$$UNAUTHENTICATEDCopyWithImpl(
      _$UNAUTHENTICATED _value, $Res Function(_$UNAUTHENTICATED) _then)
      : super(_value, (v) => _then(v as _$UNAUTHENTICATED));

  @override
  _$UNAUTHENTICATED get _value => super._value as _$UNAUTHENTICATED;
}

/// @nodoc

class _$UNAUTHENTICATED implements UNAUTHENTICATED {
  const _$UNAUTHENTICATED();

  @override
  String toString() {
    return 'AuthenticationState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UNAUTHENTICATED);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() authenticating,
    required TResult Function(UserModel user) authenticated,
    required TResult Function() firstTime,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? firstTime,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? firstTime,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UNAUTHENTICATED value) unauthenticated,
    required TResult Function(AUTHENTICATING value) authenticating,
    required TResult Function(AUTHENTICATED value) authenticated,
    required TResult Function(FIRSTTIME value) firstTime,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UNAUTHENTICATED value)? unauthenticated,
    TResult Function(AUTHENTICATING value)? authenticating,
    TResult Function(AUTHENTICATED value)? authenticated,
    TResult Function(FIRSTTIME value)? firstTime,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UNAUTHENTICATED value)? unauthenticated,
    TResult Function(AUTHENTICATING value)? authenticating,
    TResult Function(AUTHENTICATED value)? authenticated,
    TResult Function(FIRSTTIME value)? firstTime,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class UNAUTHENTICATED implements AuthenticationState {
  const factory UNAUTHENTICATED() = _$UNAUTHENTICATED;
}

/// @nodoc
abstract class _$$AUTHENTICATINGCopyWith<$Res> {
  factory _$$AUTHENTICATINGCopyWith(
          _$AUTHENTICATING value, $Res Function(_$AUTHENTICATING) then) =
      __$$AUTHENTICATINGCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AUTHENTICATINGCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$$AUTHENTICATINGCopyWith<$Res> {
  __$$AUTHENTICATINGCopyWithImpl(
      _$AUTHENTICATING _value, $Res Function(_$AUTHENTICATING) _then)
      : super(_value, (v) => _then(v as _$AUTHENTICATING));

  @override
  _$AUTHENTICATING get _value => super._value as _$AUTHENTICATING;
}

/// @nodoc

class _$AUTHENTICATING implements AUTHENTICATING {
  const _$AUTHENTICATING();

  @override
  String toString() {
    return 'AuthenticationState.authenticating()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AUTHENTICATING);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() authenticating,
    required TResult Function(UserModel user) authenticated,
    required TResult Function() firstTime,
  }) {
    return authenticating();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? firstTime,
  }) {
    return authenticating?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? firstTime,
    required TResult orElse(),
  }) {
    if (authenticating != null) {
      return authenticating();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UNAUTHENTICATED value) unauthenticated,
    required TResult Function(AUTHENTICATING value) authenticating,
    required TResult Function(AUTHENTICATED value) authenticated,
    required TResult Function(FIRSTTIME value) firstTime,
  }) {
    return authenticating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UNAUTHENTICATED value)? unauthenticated,
    TResult Function(AUTHENTICATING value)? authenticating,
    TResult Function(AUTHENTICATED value)? authenticated,
    TResult Function(FIRSTTIME value)? firstTime,
  }) {
    return authenticating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UNAUTHENTICATED value)? unauthenticated,
    TResult Function(AUTHENTICATING value)? authenticating,
    TResult Function(AUTHENTICATED value)? authenticated,
    TResult Function(FIRSTTIME value)? firstTime,
    required TResult orElse(),
  }) {
    if (authenticating != null) {
      return authenticating(this);
    }
    return orElse();
  }
}

abstract class AUTHENTICATING implements AuthenticationState {
  const factory AUTHENTICATING() = _$AUTHENTICATING;
}

/// @nodoc
abstract class _$$AUTHENTICATEDCopyWith<$Res> {
  factory _$$AUTHENTICATEDCopyWith(
          _$AUTHENTICATED value, $Res Function(_$AUTHENTICATED) then) =
      __$$AUTHENTICATEDCopyWithImpl<$Res>;
  $Res call({UserModel user});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$AUTHENTICATEDCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$$AUTHENTICATEDCopyWith<$Res> {
  __$$AUTHENTICATEDCopyWithImpl(
      _$AUTHENTICATED _value, $Res Function(_$AUTHENTICATED) _then)
      : super(_value, (v) => _then(v as _$AUTHENTICATED));

  @override
  _$AUTHENTICATED get _value => super._value as _$AUTHENTICATED;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$AUTHENTICATED(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }

  @override
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$AUTHENTICATED implements AUTHENTICATED {
  const _$AUTHENTICATED(this.user);

  @override
  final UserModel user;

  @override
  String toString() {
    return 'AuthenticationState.authenticated(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AUTHENTICATED &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$AUTHENTICATEDCopyWith<_$AUTHENTICATED> get copyWith =>
      __$$AUTHENTICATEDCopyWithImpl<_$AUTHENTICATED>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() authenticating,
    required TResult Function(UserModel user) authenticated,
    required TResult Function() firstTime,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? firstTime,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? firstTime,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UNAUTHENTICATED value) unauthenticated,
    required TResult Function(AUTHENTICATING value) authenticating,
    required TResult Function(AUTHENTICATED value) authenticated,
    required TResult Function(FIRSTTIME value) firstTime,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UNAUTHENTICATED value)? unauthenticated,
    TResult Function(AUTHENTICATING value)? authenticating,
    TResult Function(AUTHENTICATED value)? authenticated,
    TResult Function(FIRSTTIME value)? firstTime,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UNAUTHENTICATED value)? unauthenticated,
    TResult Function(AUTHENTICATING value)? authenticating,
    TResult Function(AUTHENTICATED value)? authenticated,
    TResult Function(FIRSTTIME value)? firstTime,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class AUTHENTICATED implements AuthenticationState {
  const factory AUTHENTICATED(final UserModel user) = _$AUTHENTICATED;

  UserModel get user;
  @JsonKey(ignore: true)
  _$$AUTHENTICATEDCopyWith<_$AUTHENTICATED> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FIRSTTIMECopyWith<$Res> {
  factory _$$FIRSTTIMECopyWith(
          _$FIRSTTIME value, $Res Function(_$FIRSTTIME) then) =
      __$$FIRSTTIMECopyWithImpl<$Res>;
}

/// @nodoc
class __$$FIRSTTIMECopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$$FIRSTTIMECopyWith<$Res> {
  __$$FIRSTTIMECopyWithImpl(
      _$FIRSTTIME _value, $Res Function(_$FIRSTTIME) _then)
      : super(_value, (v) => _then(v as _$FIRSTTIME));

  @override
  _$FIRSTTIME get _value => super._value as _$FIRSTTIME;
}

/// @nodoc

class _$FIRSTTIME implements FIRSTTIME {
  const _$FIRSTTIME();

  @override
  String toString() {
    return 'AuthenticationState.firstTime()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FIRSTTIME);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() authenticating,
    required TResult Function(UserModel user) authenticated,
    required TResult Function() firstTime,
  }) {
    return firstTime();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? firstTime,
  }) {
    return firstTime?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? firstTime,
    required TResult orElse(),
  }) {
    if (firstTime != null) {
      return firstTime();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UNAUTHENTICATED value) unauthenticated,
    required TResult Function(AUTHENTICATING value) authenticating,
    required TResult Function(AUTHENTICATED value) authenticated,
    required TResult Function(FIRSTTIME value) firstTime,
  }) {
    return firstTime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UNAUTHENTICATED value)? unauthenticated,
    TResult Function(AUTHENTICATING value)? authenticating,
    TResult Function(AUTHENTICATED value)? authenticated,
    TResult Function(FIRSTTIME value)? firstTime,
  }) {
    return firstTime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UNAUTHENTICATED value)? unauthenticated,
    TResult Function(AUTHENTICATING value)? authenticating,
    TResult Function(AUTHENTICATED value)? authenticated,
    TResult Function(FIRSTTIME value)? firstTime,
    required TResult orElse(),
  }) {
    if (firstTime != null) {
      return firstTime(this);
    }
    return orElse();
  }
}

abstract class FIRSTTIME implements AuthenticationState {
  const factory FIRSTTIME() = _$FIRSTTIME;
}
