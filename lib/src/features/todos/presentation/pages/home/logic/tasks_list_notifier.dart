import 'package:flutter/material.dart';
import 'package:todolist/src/features/todos/domain/entities/task.dart';

class TasksListNotifier extends ChangeNotifier {
  final tasks = [
    Task(title: 'Comprar zanahorias', date: DateTime(2020, 1)),
    Task(title: 'Bañar a los perros', date: DateTime(2020, 2)),
    Task(title: 'Lavar la ropa', date: DateTime(2020, 3)),
    Task(title: 'Llamar a Jorge', date: DateTime(2020, 4)),
    Task(title: 'Pagar servicios', completed: true, date: DateTime(2020, 5)),
  ];

  List<Task> get uncompletedTasks =>
      tasks.where((task) => !task.completed).toList();
  List<Task> get completedTasks =>
      tasks.where((task) => task.completed).toList();

  void onTaskChanged(Task task) {
    tasks.remove(task);
    tasks.insert(0, task.copyWith(completed: !task.completed));
    //notifyListeners();
  }

  void animatedTaskChange(
    int index,
    Task task,
    SliverAnimatedListState from,
    SliverAnimatedListState to,
    Widget child
  ) {
    onTaskChanged(task);
    int _duration = 500;
    from.removeItem(index, (context, animation) => child, duration: Duration(milliseconds: _duration));
    to.insertItem(0);
  }
}
