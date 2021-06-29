import 'package:flutter/material.dart';
import '../../features/todos/presentation/pages/splash_screen/splash_screen_page.dart';
import '../../features/todos/presentation/pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreenPage(),
    );
  }
}
