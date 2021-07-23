import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter/foundation.dart';

import '../domain/entities/database_failures/database_failure.dart';
import '../domain/entities/task.dart';
import '../domain/interface/i_tasks_repository.dart';

class TasksNotifier extends ChangeNotifier {
  final ITasksRepository tasksRepository;
  TasksNotifier({
    required this.tasksRepository,
  });

  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  List<Task> get uncompletedTasks {
    final tasksList = _tasks
        .where((task) => !task.completed && task.parentTask == null)
        .toList();

    int index = 0;

    while (index < tasksList.length) {
      if (tasksList[index].subtasks.isNotEmpty) {
        List<Task> subtasks = [];
        for (final String subtaskID in tasksList[index].subtasks) {
          final Task subtask =
              _tasks.firstWhere((listTask) => listTask.id == subtaskID);
          if (!subtask.completed) subtasks.add(subtask);
        }
        subtasks.sort((a, b) => b.modified.compareTo(a.modified));
        if (index == tasksList.length - 1) {
          tasksList.addAll(subtasks);
        } else {
          tasksList.insertAll(index + 1, subtasks);
        }
      }
      index++;
    }

    return tasksList;
  }

  List<Task> get completedTasks =>
      _tasks.where((task) => task.completed).toList();

  List<Task> getSubtasks({required List<String> subtasksIds}) {
    List<Task> subtasks = [];
    for (final String taskId in subtasksIds) {
      final Task subtask =
          _tasks.firstWhere((listTask) => listTask.id == taskId);
      subtasks.add(subtask);
    }
    return subtasks;
  }

  Future<Either<DatabaseFailure, Unit>> getTasks(
      {required String selectedListId}) async {
    final result = await tasksRepository.readTasks();
    return result.fold(
      (failure) {
        print(failure);
        return left(failure);
      },
      (tasks) {
        _tasks = tasks
            .where((listTask) => listTask.listId == selectedListId)
            .toList();
        _sortTasks();
        return right(unit);
      },
    );
  }

  Future<void> createTask({required Task task}) async {
    _tasks.insert(0, task);
    await tasksRepository.createTask(task: task);
    notifyListeners();
  }

  Future<void> deleteTask({required String taskId}) async {
    _tasks.removeWhere((task) => task.id == taskId);
    await tasksRepository.deleteTask(taskId: taskId);
    notifyListeners();
  }

  Task getTaskById(String id) =>
      _tasks.firstWhere((listTask) => listTask.id == id);

  Future<void> _removeSubtaskReference(
      {required Task parentTask, required String subtaskId}) async {
    final newSubtasks = parentTask.subtasks;
    newSubtasks.remove(subtaskId);
    await updateTask(newTaskInfo: parentTask.copyWith(subtasks: newSubtasks));
  }

  // Future<void> _completeSubtasks({required List<String> subtasksIds}) async {
  //   final List<Task> subtasks = getSubtasks(subtasksIds: subtasksIds);
  //   for (final Task task in subtasks) {
  //     if (!task.completed) await toggleTaskCompleted(task: task);
  //   }
  // }

  //TODO complete task
  Future<void> toggleTaskCompleted({required Task task}) async {
    //TODO call animation method for automatic completion of subtasks
    bool removeParent = false;
    if (task.completed && task.parentTask != null) {
      final parentTask = getTaskById(task.parentTask!);
      if (parentTask.completed) {
        await _removeSubtaskReference(
            parentTask: parentTask, subtaskId: task.id);
        removeParent = true;
      }
    }
    final newTaskInfo = task.copyWith(
      completed: !task.completed,
      parentTask: removeParent ? null : task.parentTask,
      modified: DateTime.now(),
    );
    await updateTask(newTaskInfo: newTaskInfo);
    // if (!task.completed && task.subtasks.isNotEmpty) {
    //   await _completeSubtasks(subtasksIds: task.subtasks);
    // }
  }

  Future<void> updateTask({required Task newTaskInfo}) async {
    // newTaskInfo = newTaskInfo.copyWith(modified: DateTime.now());
    final index = _tasks.indexWhere((task) => task.id == newTaskInfo.id);
    _tasks[index] = newTaskInfo;
    _sortTasks();
    await tasksRepository.updateTask(task: newTaskInfo);
    notifyListeners();
  }

  void _sortTasks() => _tasks.sort((a, b) => b.modified.compareTo(a.modified));
}
