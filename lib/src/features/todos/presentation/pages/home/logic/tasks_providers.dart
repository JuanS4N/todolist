import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/src/features/todos/presentation/pages/home/logic/tasks_list_notifier.dart';

final tasksListProvider = ChangeNotifierProvider<TasksListNotifier>((ref) {
    return TasksListNotifier();
});