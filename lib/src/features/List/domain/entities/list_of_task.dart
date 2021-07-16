import 'package:flutter/foundation.dart';
import 'package:todolist/src/features/List/repositories/list_hive_dto.dart';

class TaskList {
  int listId;
  String listName;
  bool isActive;
  TaskList(this.listId, this.listName, this.isActive);

  factory TaskList.fromHiveDTO(HiveListObject hiveListObject) {
    return TaskList(
        hiveListObject.key, hiveListObject.listName, hiveListObject.isActive);
  }
}
