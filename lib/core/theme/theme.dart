import 'package:flutter/material.dart';

import 'app_pallete.dart';

class AppTheme {
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    appBarTheme: AppBarTheme(
      shadowColor: Colors.transparent,
      elevation: 0,
      backgroundColor: AppPallete.backgroundColor,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.w600,
        fontFamily: 'Proxima Nova',
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.41,
        fontFamily: 'Proxima Nova',
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: 'Proxima Nova',
        color: Colors.white,
      ),
      titleSmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: 'Proxima Nova',
        color: Colors.white,
      ),
      labelMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: 'Proxima Nova',
        color: Colors.white,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'Proxima Nova',
        color: Colors.white54,
      ),
      displaySmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        fontFamily: 'Proxima Nova',
        color: Colors.white,
        letterSpacing: 0.5,
        height: 16 / 11,
      ),
    ),
  );
}
