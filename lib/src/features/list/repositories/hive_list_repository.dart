import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import '../domain/contracts/i_repositories.dart';
import '../domain/entities/list_of_task.dart';
import 'list_hive_dto.dart';
import '../../tasks/domain/entities/database_failures/database_failure.dart';

class HiveListRepository extends IListRepository {
  static final String BOX_NAME = "list";

  HiveListRepository() {
    Hive.registerAdapter(HiveListObjectAdapter());
    checkBox(BOX_NAME);
  }

  @override
  Future<Either<DatabaseFailure, Unit>> createList(
      {required TaskList list}) async {
    try {
      await Hive.box<HiveListObject>(BOX_NAME)
          .add(HiveListObject.fromTaskList(list));
      return right(unit);
    } catch (exception) {
      print(exception.toString());
      return left(const DatabaseFailure.serverError());
    }
  }

  @override
  Future<Either<DatabaseFailure, List<TaskList>>> readAllList() async {
    try {
      await checkBox(BOX_NAME);
      final List<TaskList> userList = Hive.box<HiveListObject>(BOX_NAME)
          .values
          .map((hiveListObject) => TaskList.fromHiveDTO(hiveListObject))
          .toList();

      print(userList);

      return right(userList);
    } catch (exception) {
      return left(const DatabaseFailure.serverError());
    }
  }

  Future<void> checkBox(String boxName) async {
    print("Checking box");
    if (!Hive.isBoxOpen(boxName)) {
      print("Crerating box");
      var opened = await Hive.openBox<HiveListObject>(boxName);
      if (opened.isEmpty) {
        var defaultList = TaskList(
            isActive: true,
            listName: 'Default List',
            listId: 0,
            isDefaultList: true);
        createList(list: defaultList);
      }
    }
  }

  @override
  Future<Either<DatabaseFailure, Unit>> updateList(
      {required TaskList list}) async {
    try {
      Hive.box<HiveListObject>(BOX_NAME)
          .put(list.listId, HiveListObject.fromTaskList(list));

      return right(unit);
    } catch (exception) {
      print(exception.toString());
      return left(const DatabaseFailure.serverError());
    }
  }
}
