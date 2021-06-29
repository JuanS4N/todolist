import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/src/features/todos/application/tasks_notifier.dart';
import 'package:todolist/src/features/todos/data/repositories/hive_tasks_repository.dart';
import 'package:todolist/src/features/todos/domain/interface/i_tasks_repository.dart';

final localTasksRepository = Provider<ITasksRepository>((ref) {
  return HiveTasksRepository();
});

final tasksNotifierProvider = ChangeNotifierProvider<TasksNotifier>((ref) {
  final ITasksRepository _tasksRepository = ref.watch(localTasksRepository);
  return TasksNotifier(tasksRepository: _tasksRepository);
});
