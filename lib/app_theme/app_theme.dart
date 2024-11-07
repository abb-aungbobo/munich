import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: _appBarTheme,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepOrange,
      primary: Colors.orange,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    appBarTheme: _appBarTheme,
    colorScheme: ColorScheme.dark(
      primary: Colors.orange,
    ),
  );

  static const _appBarTheme = AppBarTheme(
    centerTitle: true,
  );
}
