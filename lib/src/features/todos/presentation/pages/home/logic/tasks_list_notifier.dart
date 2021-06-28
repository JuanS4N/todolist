import 'package:flutter/material.dart';
import 'package:todolist/src/features/todos/domain/entities/task.dart';

class TasksListNotifier extends ChangeNotifier {
  final tasks = [
    Task(title: 'Comprar zanahorias'),
    Task(title: 'Bañar a los perros'),
    Task(title: 'Lavar la ropa'),
    Task(title: 'Llamar a Jorge'),
    Task(title: 'Pagar servicios', completed: true),
  ];

  List<Task> get uncompletedTasks => tasks.where((task) => !task.completed).toList();
  List<Task> get completedTasks => tasks.where((task) => task.completed).toList();

  void onTaskChanged(Task task) {
    tasks.remove(task);
    tasks.insert(0, task.copyWith(completed: !task.completed));
    notifyListeners();
  }
}