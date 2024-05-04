import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../const/const_router.dart';
import '../../models/params/param_login.dart';
import '../../models/response/response_message.dart';
import '../../services/api/api_user/api_user.dart';
import '../../services/get_it/get_instance.dart';
import '../../services/storage/my_data_storage.dart';
import '../../services/storage/security_storage.dart';

part 'splash_bloc.freezed.dart';
part 'splash_event.dart';
part 'splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final internetStatus = StreamController<bool>.broadcast();

  StreamSubscription<ConnectivityResult>? checkConnect;

  SplashBloc() : super(const SplashState()) {
    on<StartApp>(_onStartApp);
  }

  void listendConnectivityChanged() {
    checkConnect = Connectivity().onConnectivityChanged.listen(
          (result) => internetStatus.sink.add(
            result == ConnectivityResult.none,
          ),
        );
  }

  Future<void> login() async {
    await StorageService.readData();

    final ResponseMessage result = await apiPostLogin(
      ParamLogin(
        email: '${MyDataStorage.singleton.email}',
        password: '${MyDataStorage.singleton.password}',
      ),
    );

    if (result.isSuccess) {
      await GetInstance.navigator.pushReplacementNamed(ConstRouter.home);
    } else {
      await GetInstance.navigator.pushReplacementNamed(ConstRouter.login);
    }
  }

  FutureOr<void> _onStartApp(StartApp event, Emitter<SplashState> emit) {
    listendConnectivityChanged();
  }

  @override
  Future<void> close() {
    checkConnect?.cancel();
    internetStatus.close();
    return super.close();
  }
}
