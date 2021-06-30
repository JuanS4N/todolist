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
  List<Task> get uncompletedTasks =>
      _tasks.where((task) => !task.completed).toList();
  List<Task> get completedTasks =>
      _tasks.where((task) => task.completed).toList();

  Future<Either<DatabaseFailure, Unit>> getTasks() async {
    final result = await tasksRepository.readTasks();
    return result.fold(
      (failure) {
        print(failure);
        return left(failure);
      },
      (tasks) {
        _tasks = tasks;
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

  //TODO complete task
  toggleTaskCompleted({required Task task}) {
    final newTaskInfo =
        task.copyWith(completed: !task.completed, modified: DateTime.now());
    updateTask(newTaskInfo: newTaskInfo);
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
