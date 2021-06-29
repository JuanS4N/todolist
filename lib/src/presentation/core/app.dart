import 'package:flutter/material.dart';
import 'package:todolist/src/features/todos/presentation/pages/splash_screen/splash_screen_page.dart';
import '../../features/todos/presentation/pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: Typography.englishLike2018.copyWith(
              bodyText2: Typography.englishLike2018.bodyText2!.copyWith(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500))),
      home: SplashScreenPage(),
    );
  }
}
