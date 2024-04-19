import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'const/const_app.dart';
import 'services/get_it/config_get_it.dart';
import 'services/navigator/setup_navigator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
            theme: ThemeData(useMaterial3: true),
          ),
        );
      },
    );
  }
}
