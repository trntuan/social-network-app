import 'package:get_it/get_it.dart';

import '../navigator/config_navigator.dart';

class GetStores {
  /// singleton

  static ConfigNavigator get navigator => GetIt.instance.get<ConfigNavigator>();
}
