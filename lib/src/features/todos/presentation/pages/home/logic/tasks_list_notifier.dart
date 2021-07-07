import 'package:flutter/material.dart';
import 'package:todolist/src/features/todos/domain/entities/todo.dart';
import 'package:todolist/src/features/todos/presentation/pages/home/widgets/task_tile.dart';
import 'package:todolist/src/features/todos/domain/entities/task.dart';

class TasksListNotifier extends ChangeNotifier {
  final tasks = List.generate(
    10,
    (index) => Task(
      title: 'Task Title $index',
      description: index % 2 == 0
          ? '$index Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sit amet turpis nec ante feugiat euismod.'
          : null,
      //date: DateTime.now(),
      completed: index % 3 == 0,
      subtasks: index % 4 == 0
          ? [
              Todo(title: 'SubTask $index'),
              Todo(title: 'SubTask $index'),
              Todo(title: 'SubTask $index'),
              Todo(title: 'SubTask $index'),
            ]
          : [],
    ),
  );

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
