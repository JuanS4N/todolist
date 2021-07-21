import 'package:flutter/foundation.dart';
import 'package:todolist/src/features/List/repositories/list_hive_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_of_task.freezed.dart';

@freezed
class TaskList with _$TaskList {
  /*
  int listId;
  String listName;
  bool isActive;
  */

  factory TaskList(
      {required int listId,
      required String listName,
      required bool isActive}) = _TaskList;

  factory TaskList.namedList(String listName) {
    return _TaskList(isActive: false, listId: 0, listName: listName);
  }

  factory TaskList.fromHiveDTO(HiveListObject hiveListObject) {
    return _TaskList(
        listId: hiveListObject.key,
        listName: hiveListObject.listName,
        isActive: hiveListObject.isActive);
  }

  /*
  TaskList(this.listId, this.listName, this.isActive);

  factory TaskList.fromHiveDTO(HiveListObject hiveListObject) {
    return TaskList(
        hiveListObject.key, hiveListObject.listName, hiveListObject.isActive);
  }

  factory TaskList.namedList(String listName) {
    return TaskList(0, listName, false);
  }
  */
}
