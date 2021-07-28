import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/src/features/tasks/data/repositories/hive_tasks_repository.dart';
import 'package:todolist/src/features/tasks/domain/interface/i_tasks_repository.dart';

import 'tasks_notifier.dart';

final localTasksRepository = Provider<ITasksRepository>((ref) {
  return HiveTasksRepository();
});

final tasksNotifierProvider = ChangeNotifierProvider<TasksNotifier>((ref) {
  final ITasksRepository _tasksRepository = ref.watch(localTasksRepository);
  return TasksNotifier(tasksRepository: _tasksRepository);
});

final createTaskProvider = ChangeNotifierProvider<CreateTaskNotifier>((ref) {
  final ITasksRepository _taskRepository = ref.watch(localTasksRepository);
  return CreateTaskNotifier(taskRepository: _taskRepository, reference: ref);
});
