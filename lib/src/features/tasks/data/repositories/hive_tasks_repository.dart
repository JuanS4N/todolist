import 'package:dartz/dartz.dart' hide Task;
import 'package:hive/hive.dart';

import '../../domain/entities/database_failures/database_failure.dart';
import '../../domain/entities/task.dart';
import '../../domain/interface/i_tasks_repository.dart';

class HiveTasksRepository implements ITasksRepository {
  @override
  Future<Either<DatabaseFailure, Unit>> createTask({required Task task}) =>
      _saveTask(task: task);

  @override
  Future<Either<DatabaseFailure, Unit>> deleteTask(
      {required String taskId}) async {
    try {
      if (!Hive.isBoxOpen('tasks'))
        await Hive.openBox<Map<dynamic, dynamic>>('tasks');
      await Hive.box<Map<dynamic, dynamic>>('tasks').delete(taskId);
      return right(unit);
    } catch (e) {
      return left(const DatabaseFailure.serverError());
    }
  }

  @override
  Future<Either<DatabaseFailure, List<Task>>> readTasks() async {
    try {
      if (!Hive.isBoxOpen('tasks'))
        await Hive.openBox<Map<dynamic, dynamic>>('tasks');
      final tasks = Hive.box<Map<dynamic, dynamic>>('tasks')
          .values
          .map((taskMap) => Task.fromMap(taskMap))
          .toList();
      return right(tasks);
    } catch (e) {
      return left(const DatabaseFailure.serverError());
    }
  }

  @override
  Future<Either<DatabaseFailure, Unit>> updateTask({required Task task}) =>
      _saveTask(task: task);

  Future<Either<DatabaseFailure, Unit>> _saveTask({required Task task}) async {
    try {
      if (!Hive.isBoxOpen('tasks'))
        await Hive.openBox<Map<dynamic, dynamic>>('tasks');
      await Hive.box<Map<dynamic, dynamic>>('tasks').put(task.id, task.toMap());
      return right(unit);
    } catch (e) {
      return left(const DatabaseFailure.serverError());
    }
  }

  @override
  Future<Either<DatabaseFailure, Unit>> deleteTaskWithListId(
      {required List listIds}) async {
    try {
      if (!Hive.isBoxOpen('tasks'))
        await Hive.openBox<Map<dynamic, dynamic>>('tasks');

      await Hive.box<Map<dynamic, dynamic>>('tasks').deleteAll(listIds);

      return right(unit);
    } catch (e) {
      print(e);
      return left(const DatabaseFailure.serverError());
    }
  }
}
