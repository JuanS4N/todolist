import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:todolist/src/features/List/domain/contracts/i_repositories.dart';
import 'package:todolist/src/features/tasks/domain/entities/database_failures/database_failure.dart';
import 'package:todolist/src/features/List/domain/entities/list_of_task.dart';

import 'list_hive_dto.dart';

class HiveListRepository extends IListRepository {
  static final String BOX_NAME = "list";

  @override
  Future<Either<DatabaseFailure, Unit>> createList(
      {required TaskList list}) async {
    try {
      checkBox(BOX_NAME);
      await Hive.box(BOX_NAME).add(HiveListObject.fromTaskList(list));

      return right(unit);
    } catch (exception) {
      return left(const DatabaseFailure.serverError());
    }
  }

  @override
  Future<Either<DatabaseFailure, List<TaskList>>> readAllList() async {
    try {
      checkBox(BOX_NAME);

      final List<TaskList> userList = Hive.box(BOX_NAME)
          .values
          .map((hiveListObject) => TaskList.fromHiveDTO(hiveListObject))
          .toList();

      return right(userList);
    } catch (exception) {
      return left(const DatabaseFailure.serverError());
    }
  }

  void checkBox(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      await Hive.openBox<HiveListObject>(boxName);
    }
  }
}
