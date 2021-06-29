import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/src/features/todos/application/tasks_notifier.dart';
import 'package:todolist/src/features/todos/application/tasks_provider.dart';
import 'tasks_list_notifier.dart';

final tasksListProvider = ChangeNotifierProvider<TasksListNotifier>((ref) {
  return TasksListNotifier(read: ref.read);
});
