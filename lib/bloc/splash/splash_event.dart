part of 'splash_bloc.dart';

abstract class SplashEvent {
  const SplashEvent();
}

@freezed
class StartApp extends SplashEvent with _$StartApp {
  const factory StartApp() = _StartApp;
}
