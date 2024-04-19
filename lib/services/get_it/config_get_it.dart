import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'config_get_it.config.dart';

GetIt instance = GetIt.instance;

@injectableInit
void configureGetIt() => instance.init();
