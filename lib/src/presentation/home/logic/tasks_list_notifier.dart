import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/tasks/application/tasks_provider.dart';
import '../../../features/tasks/domain/entities/task.dart';
import '../widgets/uncompleted_task_tile.dart';

class TasksListNotifier extends ChangeNotifier {
  final Reader read;
  TasksListNotifier({
    required this.read,
  });

  // Future<void> animatedTaskChange(
  //   int index,
  //   Task task,
  //   SliverAnimatedListState from,
  //   // SliverAnimatedListState to,
  // ) async {
  //   int _duration = 250;
  //   await read(tasksNotifierProvider).toggleTaskCompleted(task: task);
  //   from.removeItem(
  //     index,
  //     (context, animation) => TaskTile(task: task, animation: animation),
  //     duration: Duration(milliseconds: _duration),
  //   );
  //   // to.insertItem(0);
  // }

  Future<void> uncompleteTask(
      int index, Task task, SliverAnimatedListState uncompletedState) async {
    await read(tasksNotifierProvider).toggleTaskCompleted(task: task);
    uncompletedState.insertItem(index);
  }

  Future<void> completeTask(
      int index, Task task, SliverAnimatedListState uncompletedState,
      {List<String>? subtasks}) async {
    late List<String> _subtasks;

    if (task.subtasks.isNotEmpty) {
      _subtasks = task.subtasks;
    } else {
      _subtasks = subtasks ?? [];
    }

    while (_subtasks.isNotEmpty) {
      Task _task = read(tasksNotifierProvider).getTaskById(_subtasks[0]);
      _subtasks.removeAt(0);
      await completeTask(index + 1, _task, uncompletedState);
    }

    await read(tasksNotifierProvider).toggleTaskCompleted(task: task);
    
    uncompletedState.removeItem(
      index,
      (context, animation) =>
          UncompletedTaskTile(task: task, animation: animation),
      duration: Duration(milliseconds: 250),
    );
  }

  List<Task> getSubtasksFromParent(Task task) {
    late List<Task> _subtasks;
    _subtasks =
        read(tasksNotifierProvider).getSubtasks(subtasksIds: task.subtasks);
    return _subtasks;
  }

  Future<void> updateTask(Task task)async {
    await read(tasksNotifierProvider).updateTask(newTaskInfo: task);
  }
}
