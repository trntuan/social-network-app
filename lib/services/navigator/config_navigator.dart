import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../extension/go_router_extension.dart';
import '../../models/params/params_gallery_image.dart';
import '../../widgets/gallery_image/gallery_image.dart';

@lazySingleton
class ConfigNavigator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  const ConfigNavigator();
  bool get canPop => navigatorKey.currentState?.canPop() ?? false;

  String get currentLocation =>
      GoRouter.of(ConfigNavigator.navigatorKey.currentContext!).location();

  Future<T?> push<T extends Object?>(String location, {T? extra}) =>
      GoRouter.of(navigatorKey.currentContext!).push<T>(location, extra: extra);

  Future<T?>? pushNamed<T extends Object?>(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    T? extra,
  }) {
    if (!currentLocation.contains(name)) {
      return GoRouter.of(navigatorKey.currentContext!).pushNamed<T>(
        name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: extra,
      );
    }
    return null;
  }

  void goGalleryImage(ParamsGalleryImage params) {
    navigatorKey.currentState?.push(
      GalleryImage(
        params: params,
      ),
    );
  }

  Future<T?> pushReplacementNamed<T extends Object?>(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    T? extra,
  }) {
    return GoRouter.of(navigatorKey.currentContext!).pushReplacementNamed(
      name,
      extra: extra,
    );
  }

  void goReplacementNamed<T extends Object?>(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    T? extra,
  }) {
    GoRouter.of(navigatorKey.currentContext!).goNamed(
      name,
      extra: extra,
    );
  }

  /// Pop the top page off the Navigator's page stack by calling
  /// [Navigator.pop].
  void pop<T extends Object?>([T? result]) {
    if (canPop) {
      GoRouter.of(navigatorKey.currentContext!).pop(result);
    }
  }
}
