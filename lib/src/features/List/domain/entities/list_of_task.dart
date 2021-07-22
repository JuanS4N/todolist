import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../list/repositories/list_hive_dto.dart';

part 'list_of_task.freezed.dart';

@freezed
class TaskList with _$TaskList {
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
}
