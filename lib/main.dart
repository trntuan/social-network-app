import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'const/const_app.dart';
import 'services/get_it/config_get_it.dart';
import 'services/navigator/setup_navigator.dart';
import 'services/socket/socket.dart';
import 'theme/theme_color.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WebSocketManager.instance.initializeSocketConnection();
  // Khởi tạo dữ liệu địa phương cho tiếng Việt
  await initializeDateFormatting('vi', null);
  configureGetIt();

  runApp(const MainApp());
}

final _router = SetupRouter();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle.light.copyWith(
    //     statusBarIconBrightness: Brightness.dark,
    //     statusBarColor: ThemeColors.greyBf,
    //   ),
    // );

    return ScreenUtilInit(
      designSize: ConstApp.defaultDesignSize,
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: _router.appRouter,
            theme: ThemeData(useMaterial3: true).copyWith(
              colorScheme: const ColorScheme.light(
                primary: ThemeColors.blue,
                secondary: ThemeColors.blue,
              ),
            ),
          ),
        );
      },
    );
  }
}
