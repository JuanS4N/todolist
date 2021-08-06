import 'package:dartz/dartz.dart' hide Task;

import '../entities/database_failures/database_failure.dart';
import '../entities/task.dart';

abstract class ITasksRepository {
  Future<Either<DatabaseFailure, Unit>> createTask({required Task task});
  Future<Either<DatabaseFailure, List<Task>>> readTasks();
  Future<Either<DatabaseFailure, Unit>> updateTask({required Task task});
  Future<Either<DatabaseFailure, Unit>> deleteTask({required String taskId});
  Future<Either<DatabaseFailure, Unit>> deleteTaskWithListId(
      {required List listIds});
}
