import 'package:flutter/material.dart';
import 'package:munich/app_router/app_router.dart';
import 'package:munich/app_theme/app_theme.dart';

class MunichApp extends StatelessWidget {
  const MunichApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: appRouter,
    );
  }
}
