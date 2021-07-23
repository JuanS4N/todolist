import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/src/features/list/application/list_providers.dart';

import '../../features/tasks/application/tasks_provider.dart';
import '../home/home_page.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await context.read(listProvider).fetchTaskList();
      
      final selectedListId = context.read(listProvider).selectedListId;

      final getTasksResult = await context
          .read(tasksNotifierProvider)
          .getTasks(selectedListId: selectedListId);
      getTasksResult.fold(
        (failure) => print(failure),
        (_) => Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) =>
                HomePage(),
            transitionDuration: const Duration(seconds: 1),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final curvedAnimation =
                  CurvedAnimation(parent: animation, curve: Curves.easeInOut);
              return FadeTransition(
                opacity: Tween<double>(begin: 0.0, end: 1.0)
                    .animate(curvedAnimation),
                child: child,
              );
            },
          ),
        ),
      );
    });
    return Scaffold(
      body: Center(
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
