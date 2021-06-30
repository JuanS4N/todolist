import 'package:flutter/material.dart';
import '../../../../application/tasks_provider.dart';
import '../../../../domain/entities/task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeFAB extends ConsumerWidget {
  const HomeFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return FloatingActionButton(
      onPressed: () {
        final newTask = Task(
          title: 'Subtask',
          modified: DateTime.now(),
          date: DateTime(2021, 8, 12),
          description: 'Task description',
          parentTask: UniqueKey().toString(),
          subtasks: [
            UniqueKey().toString(),
            UniqueKey().toString(),
            UniqueKey().toString(),
          ],
        );
        context.read(tasksNotifierProvider).createTask(task: newTask);
      },
      child: Icon(Icons.add),
      elevation: 0.0,
    );
  }
}
