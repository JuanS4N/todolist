import 'package:flutter/material.dart';
import 'package:todolist/src/features/todos/domain/entities/task.dart';
import 'package:todolist/src/features/todos/presentation/pages/home/widgets/task_tile.dart';

class TasksListNotifier extends ChangeNotifier {
  final tasks = [
    Task(
        title: 'Comprar zanahorias',
        date: DateTime(2020, 1),
        modified: DateTime.now()),
    Task(
        title: 'Bañar a los perros',
        date: DateTime(2020, 2),
        modified: DateTime.now()),
    Task(
        title: 'Lavar la ropa',
        date: DateTime(2020, 3),
        modified: DateTime.now()),
    Task(
        title: 'Llamar a Jorge',
        date: DateTime(2020, 4),
        modified: DateTime.now()),
    Task(
        title: 'Pagar servicios',
        completed: true,
        date: DateTime(2020, 5),
        modified: DateTime.now()),
  ];

  List<Task> get uncompletedTasks =>
      tasks.where((task) => !task.completed).toList();
  List<Task> get completedTasks =>
      tasks.where((task) => task.completed).toList();

  void onTaskChanged(Task task) {
    tasks.remove(task);
    tasks.insert(0, task.copyWith(completed: !task.completed));
    notifyListeners();
  }

  void animatedTaskChange(int index, Task task, SliverAnimatedListState from,
      SliverAnimatedListState to) {
    int _duration = 250;
    from.removeItem(
      index,
      (context, animation) => TaskTile(task: task, animation: animation),
      duration: Duration(milliseconds: _duration),
    );
    onTaskChanged(task);
    to.insertItem(0);
  }
}
