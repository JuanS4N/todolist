import 'package:hive/hive.dart';

import '../domain/entities/list_of_task.dart';

part 'list_hive_dto.g.dart';

@HiveType(typeId: 0)
class HiveListObject extends HiveObject {
  @HiveField(0)
  String listName;

  @HiveField(1)
  bool isActive;

  @HiveField(2)
  bool isDefaultList;

  HiveListObject(this.listName, this.isActive, {this.isDefaultList = false});

  factory HiveListObject.fromTaskList(TaskList list) {
    return HiveListObject(list.listName, list.isActive,
        isDefaultList: list.isDefaultList);
  }
}
