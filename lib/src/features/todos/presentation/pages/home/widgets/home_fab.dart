import 'package:flutter/material.dart';
import '../../../../application/tasks_provider.dart';
import '../../../../domain/entities/task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../domain/entities/todo.dart';

class HomeFAB extends ConsumerWidget {
  const HomeFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return FloatingActionButton(
      onPressed: () {
        final newTask = Task(
          title: 'Segundo task con todos los datos',
          modified: DateTime.now(),
          date: DateTime(2021, 8, 12),
          description: 'Task description',
          subtasks: [
            Todo(
              title: 'Subtask 1',
              modified: DateTime.now(),
            ),
            Todo(
              title: 'Subtask 2',
              modified: DateTime.now(),
            ),
            Todo(
              title: 'Subtask 3',
              modified: DateTime.now(),
            ),
          ],
        );
        context.read(tasksNotifierProvider).createTask(task: newTask);
      },
      child: Icon(Icons.add),
      elevation: 0.0,
    );
  }
}
