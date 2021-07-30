import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/list/application/list_providers.dart';
import '../../features/tasks/application/tasks_provider.dart';
import '../widgets/refresh_home.dart';

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
          pageRouteBuilder(context),
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
