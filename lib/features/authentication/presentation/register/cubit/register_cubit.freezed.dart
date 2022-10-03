// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'register_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterState {
  PhoneNumber get phoneNumber => throw _privateConstructorUsedError;
  Email get email => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;
  ConfirmPassword get confirmPassword => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PhoneNumber phoneNumber,
            Email email,
            Password password,
            ConfirmPassword confirmPassword,
            FormzStatus status)
        initial,
    required TResult Function(
            PhoneNumber phoneNumber,
            Email email,
            Password password,
            ConfirmPassword confirmPassword,
            FormzStatus status)
        validating,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber, Email email, Password password,
            ConfirmPassword confirmPassword, FormzStatus status)?
        initial,
    TResult Function(PhoneNumber phoneNumber, Email email, Password password,
            ConfirmPassword confirmPassword, FormzStatus status)?
        validating,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber, Email email, Password password,
            ConfirmPassword confirmPassword, FormzStatus status)?
        initial,
    TResult Function(PhoneNumber phoneNumber, Email email, Password password,
            ConfirmPassword confirmPassword, FormzStatus status)?
        validating,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Validating value) validating,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Validating value)? validating,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Validating value)? validating,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterStateCopyWith<RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res>;
  $Res call(
      {PhoneNumber phoneNumber,
      Email email,
      Password password,
      ConfirmPassword confirmPassword,
      FormzStatus status});
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  final RegisterState _value;
  // ignore: unused_field
  final $Res Function(RegisterState) _then;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      confirmPassword: confirmPassword == freezed
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as ConfirmPassword,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {PhoneNumber phoneNumber,
      Email email,
      Password password,
      ConfirmPassword confirmPassword,
      FormzStatus status});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$RegisterStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_Initial(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      confirmPassword: confirmPassword == freezed
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as ConfirmPassword,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {this.phoneNumber = const PhoneNumber.pure(),
      this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.confirmPassword = const ConfirmPassword.pure(),
      this.status = FormzStatus.valid});

  @override
  @JsonKey()
  final PhoneNumber phoneNumber;
  @override
  @JsonKey()
  final Email email;
  @override
  @JsonKey()
  final Password password;
  @override
  @JsonKey()
  final ConfirmPassword confirmPassword;
  @override
  @JsonKey()
  final FormzStatus status;

  @override
  String toString() {
    return 'RegisterState.initial(phoneNumber: $phoneNumber, email: $email, password: $password, confirmPassword: $confirmPassword, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.confirmPassword, confirmPassword) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(confirmPassword),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PhoneNumber phoneNumber,
            Email email,
            Password password,
            ConfirmPassword confirmPassword,
            FormzStatus status)
        initial,
    required TResult Function(
            PhoneNumber phoneNumber,
            Email email,
            Password password,
            ConfirmPassword confirmPassword,
            FormzStatus status)
        validating,
  }) {
    return initial(phoneNumber, email, password, confirmPassword, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber, Email email, Password password,
            ConfirmPassword confirmPassword, FormzStatus status)?
        initial,
    TResult Function(PhoneNumber phoneNumber, Email email, Password password,
            ConfirmPassword confirmPassword, FormzStatus status)?
        validating,
  }) {
    return initial?.call(phoneNumber, email, password, confirmPassword, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber, Email email, Password password,
            ConfirmPassword confirmPassword, FormzStatus status)?
        initial,
    TResult Function(PhoneNumber phoneNumber, Email email, Password password,
            ConfirmPassword confirmPassword, FormzStatus status)?
        validating,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(phoneNumber, email, password, confirmPassword, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Validating value) validating,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Validating value)? validating,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Validating value)? validating,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RegisterState {
  const factory _Initial(
      {final PhoneNumber phoneNumber,
      final Email email,
      final Password password,
      final ConfirmPassword confirmPassword,
      final FormzStatus status}) = _$_Initial;

  @override
  PhoneNumber get phoneNumber;
  @override
  Email get email;
  @override
  Password get password;
  @override
  ConfirmPassword get confirmPassword;
  @override
  FormzStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ValidatingCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory _$$_ValidatingCopyWith(
          _$_Validating value, $Res Function(_$_Validating) then) =
      __$$_ValidatingCopyWithImpl<$Res>;
  @override
  $Res call(
      {PhoneNumber phoneNumber,
      Email email,
      Password password,
      ConfirmPassword confirmPassword,
      FormzStatus status});
}

/// @nodoc
class __$$_ValidatingCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res>
    implements _$$_ValidatingCopyWith<$Res> {
  __$$_ValidatingCopyWithImpl(
      _$_Validating _value, $Res Function(_$_Validating) _then)
      : super(_value, (v) => _then(v as _$_Validating));

  @override
  _$_Validating get _value => super._value as _$_Validating;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_Validating(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      confirmPassword: confirmPassword == freezed
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as ConfirmPassword,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc

class _$_Validating implements _Validating {
  const _$_Validating(
      {required this.phoneNumber,
      required this.email,
      required this.password,
      required this.confirmPassword,
      required this.status});

  @override
  final PhoneNumber phoneNumber;
  @override
  final Email email;
  @override
  final Password password;
  @override
  final ConfirmPassword confirmPassword;
  @override
  final FormzStatus status;

  @override
  String toString() {
    return 'RegisterState.validating(phoneNumber: $phoneNumber, email: $email, password: $password, confirmPassword: $confirmPassword, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Validating &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.confirmPassword, confirmPassword) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(confirmPassword),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_ValidatingCopyWith<_$_Validating> get copyWith =>
      __$$_ValidatingCopyWithImpl<_$_Validating>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PhoneNumber phoneNumber,
            Email email,
            Password password,
            ConfirmPassword confirmPassword,
            FormzStatus status)
        initial,
    required TResult Function(
            PhoneNumber phoneNumber,
            Email email,
            Password password,
            ConfirmPassword confirmPassword,
            FormzStatus status)
        validating,
  }) {
    return validating(phoneNumber, email, password, confirmPassword, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber, Email email, Password password,
            ConfirmPassword confirmPassword, FormzStatus status)?
        initial,
    TResult Function(PhoneNumber phoneNumber, Email email, Password password,
            ConfirmPassword confirmPassword, FormzStatus status)?
        validating,
  }) {
    return validating?.call(
        phoneNumber, email, password, confirmPassword, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhoneNumber phoneNumber, Email email, Password password,
            ConfirmPassword confirmPassword, FormzStatus status)?
        initial,
    TResult Function(PhoneNumber phoneNumber, Email email, Password password,
            ConfirmPassword confirmPassword, FormzStatus status)?
        validating,
    required TResult orElse(),
  }) {
    if (validating != null) {
      return validating(phoneNumber, email, password, confirmPassword, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Validating value) validating,
  }) {
    return validating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Validating value)? validating,
  }) {
    return validating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Validating value)? validating,
    required TResult orElse(),
  }) {
    if (validating != null) {
      return validating(this);
    }
    return orElse();
  }
}

abstract class _Validating implements RegisterState {
  const factory _Validating(
      {required final PhoneNumber phoneNumber,
      required final Email email,
      required final Password password,
      required final ConfirmPassword confirmPassword,
      required final FormzStatus status}) = _$_Validating;

  @override
  PhoneNumber get phoneNumber;
  @override
  Email get email;
  @override
  Password get password;
  @override
  ConfirmPassword get confirmPassword;
  @override
  FormzStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_ValidatingCopyWith<_$_Validating> get copyWith =>
      throw _privateConstructorUsedError;
}