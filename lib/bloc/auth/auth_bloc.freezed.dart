// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEventLogin {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthEventLoginCopyWith<AuthEventLogin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventLoginCopyWith<$Res> {
  factory $AuthEventLoginCopyWith(
          AuthEventLogin value, $Res Function(AuthEventLogin) then) =
      _$AuthEventLoginCopyWithImpl<$Res, AuthEventLogin>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$AuthEventLoginCopyWithImpl<$Res, $Val extends AuthEventLogin>
    implements $AuthEventLoginCopyWith<$Res> {
  _$AuthEventLoginCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthEventLoginImplCopyWith<$Res>
    implements $AuthEventLoginCopyWith<$Res> {
  factory _$$AuthEventLoginImplCopyWith(_$AuthEventLoginImpl value,
          $Res Function(_$AuthEventLoginImpl) then) =
      __$$AuthEventLoginImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$AuthEventLoginImplCopyWithImpl<$Res>
    extends _$AuthEventLoginCopyWithImpl<$Res, _$AuthEventLoginImpl>
    implements _$$AuthEventLoginImplCopyWith<$Res> {
  __$$AuthEventLoginImplCopyWithImpl(
      _$AuthEventLoginImpl _value, $Res Function(_$AuthEventLoginImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$AuthEventLoginImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthEventLoginImpl implements _AuthEventLogin {
  _$AuthEventLoginImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEventLogin(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthEventLoginImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthEventLoginImplCopyWith<_$AuthEventLoginImpl> get copyWith =>
      __$$AuthEventLoginImplCopyWithImpl<_$AuthEventLoginImpl>(
          this, _$identity);
}

abstract class _AuthEventLogin implements AuthEventLogin {
  factory _AuthEventLogin(
      {required final String email,
      required final String password}) = _$AuthEventLoginImpl;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$AuthEventLoginImplCopyWith<_$AuthEventLoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthEventRegister {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  int? get gender => throw _privateConstructorUsedError;
  String get dateOfBirth => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthEventRegisterCopyWith<AuthEventRegister> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventRegisterCopyWith<$Res> {
  factory $AuthEventRegisterCopyWith(
          AuthEventRegister value, $Res Function(AuthEventRegister) then) =
      _$AuthEventRegisterCopyWithImpl<$Res, AuthEventRegister>;
  @useResult
  $Res call(
      {String email,
      String password,
      String displayName,
      int? gender,
      String dateOfBirth});
}

/// @nodoc
class _$AuthEventRegisterCopyWithImpl<$Res, $Val extends AuthEventRegister>
    implements $AuthEventRegisterCopyWith<$Res> {
  _$AuthEventRegisterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? displayName = null,
    Object? gender = freezed,
    Object? dateOfBirth = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int?,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthEventRegisterImplCopyWith<$Res>
    implements $AuthEventRegisterCopyWith<$Res> {
  factory _$$AuthEventRegisterImplCopyWith(_$AuthEventRegisterImpl value,
          $Res Function(_$AuthEventRegisterImpl) then) =
      __$$AuthEventRegisterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      String displayName,
      int? gender,
      String dateOfBirth});
}

/// @nodoc
class __$$AuthEventRegisterImplCopyWithImpl<$Res>
    extends _$AuthEventRegisterCopyWithImpl<$Res, _$AuthEventRegisterImpl>
    implements _$$AuthEventRegisterImplCopyWith<$Res> {
  __$$AuthEventRegisterImplCopyWithImpl(_$AuthEventRegisterImpl _value,
      $Res Function(_$AuthEventRegisterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? displayName = null,
    Object? gender = freezed,
    Object? dateOfBirth = null,
  }) {
    return _then(_$AuthEventRegisterImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int?,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthEventRegisterImpl implements _AuthEventRegister {
  _$AuthEventRegisterImpl(
      {required this.email,
      required this.password,
      required this.displayName,
      required this.gender,
      required this.dateOfBirth});

  @override
  final String email;
  @override
  final String password;
  @override
  final String displayName;
  @override
  final int? gender;
  @override
  final String dateOfBirth;

  @override
  String toString() {
    return 'AuthEventRegister(email: $email, password: $password, displayName: $displayName, gender: $gender, dateOfBirth: $dateOfBirth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthEventRegisterImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, email, password, displayName, gender, dateOfBirth);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthEventRegisterImplCopyWith<_$AuthEventRegisterImpl> get copyWith =>
      __$$AuthEventRegisterImplCopyWithImpl<_$AuthEventRegisterImpl>(
          this, _$identity);
}

abstract class _AuthEventRegister implements AuthEventRegister {
  factory _AuthEventRegister(
      {required final String email,
      required final String password,
      required final String displayName,
      required final int? gender,
      required final String dateOfBirth}) = _$AuthEventRegisterImpl;

  @override
  String get email;
  @override
  String get password;
  @override
  String get displayName;
  @override
  int? get gender;
  @override
  String get dateOfBirth;
  @override
  @JsonKey(ignore: true)
  _$$AuthEventRegisterImplCopyWith<_$AuthEventRegisterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl();

  @override
  String toString() {
    return 'AuthState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _AuthState implements AuthState {
  const factory _AuthState() = _$AuthStateImpl;
}
