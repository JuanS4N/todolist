import 'package:dartz/dartz.dart';
import 'package:todolist/src/features/todos/domain/entities/task.dart'
    as TaskEntity;
import 'package:todolist/src/features/todos/domain/entities/database_failures/database_failure.dart';

abstract class ITasksRepository {
  Future<Either<DatabaseFailure, Unit>> createTask(
      {required TaskEntity.Task task});
  Future<Either<DatabaseFailure, List<TaskEntity.Task>>> readTasks();
  Future<Either<DatabaseFailure, Unit>> updateTask(
      {required TaskEntity.Task task});
  Future<Either<DatabaseFailure, Unit>> deleteTask({required String taskId});
}
