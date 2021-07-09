import 'package:flutter/material.dart';
import 'package:todolist/src/features/List/domain/entities/list_of_task.dart';
import 'package:todolist/src/features/todos/domain/entities/task.dart';
import 'package:todolist/src/features/todos/presentation/pages/home/widgets/task_tile.dart';

class TasksListNotifier extends ChangeNotifier {
  List<Task> tasks = //[];
      [
    Task(title: 'Comprar zanahorias', date: DateTime(2020, 1)),
    Task(title: 'Bañar a los perros', date: DateTime(2020, 2)),
    Task(title: 'Lavar la ropa', date: DateTime(2020, 3)),
    Task(title: 'Llamar a Jorge', date: DateTime(2020, 4)),
    Task(title: 'Pagar servicios', completed: true, date: DateTime(2020, 5)),
  ];

  String title = "Test";

  List<Task> get uncompletedTasks =>
      tasks.where((task) => !task.completed).toList();
  List<Task> get completedTasks =>
      tasks.where((task) => task.completed).toList();

  void onTaskChanged(Task task) {
    tasks.remove(task);
    tasks.insert(0, task.copyWith(completed: !task.completed));
    notifyListeners();
  }

  void setTask(TaskList paramTask) {
    title = paramTask.listName;
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
