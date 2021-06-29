import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../application/tasks_notifier.dart';
import '../../../../application/tasks_provider.dart';
import 'tasks_list_notifier.dart';

final tasksListProvider = ChangeNotifierProvider<TasksListNotifier>((ref) {
  return TasksListNotifier(read: ref.read);
});
