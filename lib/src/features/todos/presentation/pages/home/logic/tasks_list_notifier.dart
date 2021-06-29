import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/tasks_provider.dart';
import '../../../../domain/entities/task.dart';
import '../widgets/task_tile.dart';

class TasksListNotifier extends ChangeNotifier {
  final Reader read;
  TasksListNotifier({
    required this.read,
  });

  Future<void> animatedTaskChange(int index, Task task,
      SliverAnimatedListState from, SliverAnimatedListState to) async {
    int _duration = 250;
    from.removeItem(
      index,
      (context, animation) => TaskTile(task: task, animation: animation),
      duration: Duration(milliseconds: _duration),
    );
    await read(tasksNotifierProvider)
        .updateTask(newTaskInfo: task.copyWith(completed: !task.completed));
    to.insertItem(0);
  }
}
