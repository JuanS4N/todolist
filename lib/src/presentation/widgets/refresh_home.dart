import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/src/features/list/application/list_providers.dart';
import 'package:todolist/src/features/tasks/application/tasks_provider.dart';

import '../home/home_page.dart';

Future<PageRouteBuilder> pageRouteBuilderTest(BuildContext context) async {
  final selectedListId = context.read(listProvider).selectedListId;
  context.read(tasksNotifierProvider).getTasks(selectedListId: selectedListId);

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

PageRouteBuilder pageRouteBuilder(BuildContext contex) {
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
