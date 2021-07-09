import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/tasks_provider.dart';
import '../../../../domain/entities/task.dart';

class HomeFAB extends ConsumerWidget {
  const HomeFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return FloatingActionButton(
      onPressed: () async {
        Task parentTask = Task(
          title: 'Parent task 8',
          modified: DateTime.now(),
          date: DateTime(2021, 8, 12),
          description: 'Task description',
        );
        await Future.delayed(Duration(milliseconds: 2));
        final subtask1 = Task(title: 'Subtask 1 P8', parentTask: parentTask.id);
        await Future.delayed(Duration(milliseconds: 2));
        final subtask2 = Task(title: 'Subtask 2 P8', parentTask: parentTask.id);
        await Future.delayed(Duration(milliseconds: 2));
        final subtask3 = Task(title: 'Subtask 3 P8', parentTask: parentTask.id);
        parentTask = parentTask
            .copyWith(subtasks: [subtask1.id, subtask2.id, subtask3.id]);
        await context.read(tasksNotifierProvider).createTask(task: subtask3);
        await context.read(tasksNotifierProvider).createTask(task: subtask2);
        await context.read(tasksNotifierProvider).createTask(task: subtask1);
        await context.read(tasksNotifierProvider).createTask(task: parentTask);
      },
      child: Icon(Icons.add),
      elevation: 0.0,
    );
  }
}
