import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../const/const_router.dart';
import '../../models/params/param_login.dart';
import '../../models/params/param_register.dart';
import '../../models/response/response_message.dart';
import '../../services/api/api_user/api_user.dart';
import '../../services/get_it/get_instance.dart';
import '../../widgets/dialog_popup.dart';
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
      AuthEventLogin event, Emitter<AuthState> emit) async {
    final ResponseMessage result = await apiPostLogin(
      ParamLogin(
        email: '${event.email}',
        password: '${event.password}',
      ),
    );

    if (result.isSuccess) {
      await GetInstance.navigator.pushReplacementNamed(ConstRouter.home);
    } else {
      await dialogPopup(
        title: 'Thông báo',
        msg: result.message,
        useDeny: false,
      );
    }
  }

  FutureOr<void> _onAuthEventRegister(
      AuthEventRegister event, Emitter<AuthState> emit) async {
    final result = await apiPostRegister(
      ParamRegister(
        email: event.email,
        password: event.password,
        firstName: event.firstName,
        lastName: event.lastName,
        gender: event.gender,
        dateOfBirth: event.dateOfBirth,
      ),
    );

    if (result.isSuccess) {
      await dialogPopup(
        title: 'Thông báo',
        msg: 'Đăng ký Thành công',
        useDeny: false,
        actionAccept: () {
          GetInstance.navigator.pushReplacementNamed(ConstRouter.home);
        },
        //  onClosed: (p0) {
        //  GetInstance.navigator.pop(ConstRouter.home);
        //},
      );
    } else {
      await dialogPopup(
        title: 'Thông báo',
        msg: result.message,
        useDeny: false,
      );
    }
  }
}
