import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'tasks_notifier.dart';
import '../data/repositories/hive_tasks_repository.dart';
import '../domain/interface/i_tasks_repository.dart';

final localTasksRepository = Provider<ITasksRepository>((ref) {
  return HiveTasksRepository();
});

final tasksNotifierProvider = ChangeNotifierProvider<TasksNotifier>((ref) {
  final ITasksRepository _tasksRepository = ref.watch(localTasksRepository);
  return TasksNotifier(tasksRepository: _tasksRepository);
});
