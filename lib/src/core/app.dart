import 'package:flutter/material.dart';

import '../presentation/splash/splash_screen_page.dart';
import 'task_theme_data.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: dartkTheme,
      themeMode: ThemeMode.system,
      home: const SplashScreenPage(),
    );
  }
}
