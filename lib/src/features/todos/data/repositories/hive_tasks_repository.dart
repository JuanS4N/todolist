import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:todolist/src/features/todos/domain/entities/task.dart'
    as TaskEntity;
import 'package:todolist/src/features/todos/domain/interface/i_tasks_repository.dart';

import '../../domain/entities/database_failures/database_failure.dart';

class HiveTasksRepository implements ITasksRepository {
  @override
  Future<Either<DatabaseFailure, Unit>> createTask(
          {required TaskEntity.Task task}) =>
      _saveTask(task: task);

  @override
  Future<Either<DatabaseFailure, Unit>> deleteTask(
      {required String taskId}) async {
    try {
      if (!Hive.isBoxOpen('tasks'))
        await Hive.openBox<Map<String, dynamic>>('tasks');
      await Hive.box<Map<String, dynamic>>('tasks').delete(taskId);
      return right(unit);
    } catch (e) {
      return left(const DatabaseFailure.serverError());
    }
  }

  @override
  Future<Either<DatabaseFailure, List<TaskEntity.Task>>> readTasks() async {
    try {
      if (!Hive.isBoxOpen('tasks'))
        await Hive.openBox<Map<String, dynamic>>('tasks');
      final tasks = Hive.box<Map<String, dynamic>>('tasks')
          .values
          .map((taskMap) => TaskEntity.Task.fromMap(taskMap))
          .toList();
      return right(tasks);
    } catch (e) {
      return left(const DatabaseFailure.serverError());
    }
  }

  @override
  Future<Either<DatabaseFailure, Unit>> updateTask(
          {required TaskEntity.Task task}) =>
      _saveTask(task: task);

  Future<Either<DatabaseFailure, Unit>> _saveTask(
      {required TaskEntity.Task task}) async {
    try {
      if (!Hive.isBoxOpen('tasks'))
        await Hive.openBox<Map<String, dynamic>>('tasks');
      await Hive.box<Map<String, dynamic>>('tasks').put(task.id, task.toMap());
      return right(unit);
    } catch (e) {
      return left(const DatabaseFailure.serverError());
    }
  }
}
