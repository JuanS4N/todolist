import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/src/features/todos/application/tasks_provider.dart';
import '../widgets/task_tile.dart';
import '../../../../domain/entities/task.dart';

class TasksListNotifier extends ChangeNotifier {
  final Reader read;
  TasksListNotifier({
    required this.read,
  });

  Future<void> animatedTaskChange(int index, Task task,
      SliverAnimatedListState from, SliverAnimatedListState to) async {
    int _duration = 250;
    await read(tasksNotifierProvider).toggleTaskCompleted(task: task);
    from.removeItem(
      index,
      (context, animation) => TaskTile(task: task, animation: animation),
      duration: Duration(milliseconds: _duration),
    );
    to.insertItem(0);
  }
}
