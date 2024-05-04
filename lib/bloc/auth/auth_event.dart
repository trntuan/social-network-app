part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

@freezed
class AuthEventLogin extends AuthEvent with _$AuthEventLogin {
  factory AuthEventLogin({
    required String email,
    required String password,
  }) = _AuthEventLogin;
}

@freezed
class AuthEventRegister extends AuthEvent with _$AuthEventRegister {
  factory AuthEventRegister({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required int? gender,
    required String dateOfBirth,
  }) = _AuthEventRegister;
}
