import 'package:hive/hive.dart';
import 'package:todolist/src/features/List/domain/entities/list_of_task.dart';

part 'list_hive_dto.g.dart';

@HiveType(typeId: 0)
class HiveListObject extends HiveObject {
  @HiveField(0)
  String listName;

  @HiveField(1)
  bool isActive;

  HiveListObject(this.listName, this.isActive);

  factory HiveListObject.fromTaskList(TaskList list) {
    return HiveListObject(list.listName, list.isActive);
  }
}
