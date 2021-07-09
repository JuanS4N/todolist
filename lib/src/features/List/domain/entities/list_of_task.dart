import 'package:todolist/src/features/todos/domain/entities/task.dart';

class TaskList {
  int listId;
  String listName;
  bool isActive;
  TaskList(this.listId, this.listName, this.isActive);
}
