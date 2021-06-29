import 'package:flutter/foundation.dart';
import 'tasks_state.dart';
import '../domain/entities/task.dart';

import '../domain/interface/i_tasks_repository.dart';

class TasksNotifier extends ChangeNotifier {
  final ITasksRepository tasksRepository;
  TasksNotifier({
    required this.tasksRepository,
  }) {
    getTasks();
  }

  TasksState state = TasksState.initial();

  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;
  List<Task> get uncompletedTasks =>
      _tasks.where((task) => !task.completed).toList();
  List<Task> get completedTasks =>
      _tasks.where((task) => task.completed).toList();

  Future<void> getTasks() async {
    state = TasksState.loading();
    notifyListeners();
    final result = await tasksRepository.readTasks();
    result.fold(
      (failure) {
        print(failure);
        state = TasksState.error();
        notifyListeners();
      },
      (tasks) {
        _tasks = tasks;
        _sortTasks();
        state = TasksState.ready();
        notifyListeners();
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

  Future<void> updateTask({required Task newTaskInfo}) async {
    newTaskInfo = newTaskInfo.copyWith(modified: DateTime.now());
    final index = _tasks.indexWhere((task) => task.id == newTaskInfo.id);
    _tasks[index] = newTaskInfo;
    _sortTasks();
    await tasksRepository.updateTask(task: newTaskInfo);
    notifyListeners();
  }

  void _sortTasks() => _tasks.sort((a, b) => b.modified.compareTo(a.modified));
}
