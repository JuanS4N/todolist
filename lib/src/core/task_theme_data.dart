import 'package:flutter/material.dart';

final Color unactiveColor = Colors.black54;
final Color activeColor = Colors.blueAccent;

final dartkTheme = ThemeData.dark().copyWith();

final lightTheme = ThemeData.light().copyWith(
  iconTheme: ThemeData.light().iconTheme.copyWith(color: unactiveColor),
  inputDecorationTheme: ThemeData.light().inputDecorationTheme.copyWith(
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        isCollapsed: true,
        isDense: true,
      ),
  appBarTheme: ThemeData.light().appBarTheme.copyWith(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: ThemeData.light().iconTheme.copyWith(
              color: unactiveColor,
            ),
      ),
  textTheme: ThemeData.light().textTheme.copyWith(
        headline4: ThemeData().textTheme.headline4?.copyWith(
              color: Colors.black87,
            ),
        bodyText2: ThemeData().textTheme.bodyText2?.copyWith(
              color: Colors.black54,
            ),
        subtitle1: ThemeData().textTheme.subtitle1?.copyWith(
              fontSize: 17.0,
            ),
      ),
);

class TaskThemeData {}
