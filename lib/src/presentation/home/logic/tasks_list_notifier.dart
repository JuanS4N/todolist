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

  Future<void> uncompleteTask(
      Task task, SliverAnimatedListState uncompletedState) async {
    await read(tasksNotifierProvider).toggleTaskCompleted(task: task);

    int index = 0;

    if (task.parentTask != null) {
      final _uncompletedTasks = read(tasksNotifierProvider).uncompletedTasks;
      final parentTask =
          read(tasksNotifierProvider).getTaskById(task.parentTask!);
      if (!parentTask.completed) {
        index = _uncompletedTasks.indexOf(parentTask) + 1;
      }
    }
    uncompletedState.insertItem(index);
  }

  Future<void> completeTask(
      int index, Task task, SliverAnimatedListState uncompletedState) async {
    if (task.subtasks.isNotEmpty) {
      for (final String subtaskID in task.subtasks) {
        Task _subtask = read(tasksNotifierProvider).getTaskById(subtaskID);
        if (!_subtask.completed) {
          await completeTask(index + 1, _subtask, uncompletedState);
        }
      }
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

  Future<void> updateTask(Task task) async {
    await read(tasksNotifierProvider).updateTask(newTaskInfo: task);
  }
}
