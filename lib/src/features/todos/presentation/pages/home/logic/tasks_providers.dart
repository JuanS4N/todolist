import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'tasks_list_notifier.dart';

final tasksListProvider = ChangeNotifierProvider<TasksListNotifier>((ref) {
  return TasksListNotifier();
});
