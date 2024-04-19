import 'package:flutter/material.dart';

class ThemeApp {
  static ThemeData lightTheme = ThemeData(
    // brightness: Brightness.light,
    // scaffoldBackgroundColor: Colors.white,
    // colorScheme: const ColorScheme.light(background: Colors.white),
    // appBarTheme: const AppBarTheme(
    //   backgroundColor: Colors.white,
    //   elevation: 0,
    //   iconTheme: IconThemeData(color: Colors.black),
    //   titleTextStyle: TextStyle(color: Colors.black),
    // ),
    // iconTheme: const IconThemeData(color: Colors.black),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}
