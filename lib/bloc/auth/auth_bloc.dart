import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../const/const_router.dart';
import '../../models/params/param_register.dart';
import '../../services/api/api_user/api_user.dart';
import '../../services/get_it/get_instance.dart';
part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<AuthEventLogin>(_onAuthEventLogin);
    on<AuthEventRegister>(_onAuthEventRegister);
  }

  FutureOr<void> _onAuthEventLogin(
      AuthEventLogin event, Emitter<AuthState> emit) {}

  FutureOr<void> _onAuthEventRegister(
      AuthEventRegister event, Emitter<AuthState> emit) async {
    final result = await apiPostRegister(ParamRegister(
      email: event.email,
      password: event.password,
      firstName: event.firstName,
      lastName: event.lastName,
    ));

    if (result) {
      GetInstance.navigator.pop(ConstRouter.home);
    }
  }
}
