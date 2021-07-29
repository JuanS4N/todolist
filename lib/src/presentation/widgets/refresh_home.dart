import 'package:flutter/material.dart';
import 'package:todolist/src/presentation/home/home_page.dart';

PageRouteBuilder pageRouteBuilder(BuildContext context) {
  return PageRouteBuilder(
    pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) =>
        HomePage(),
    transitionDuration: const Duration(seconds: 1),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation =
          CurvedAnimation(parent: animation, curve: Curves.easeInOut);
      return FadeTransition(
        opacity: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
        child: child,
      );
    },
  );
}
