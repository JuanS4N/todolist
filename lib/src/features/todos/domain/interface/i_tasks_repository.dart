import 'package:dartz/dartz.dart' hide Task;
import 'package:todolist/src/features/todos/domain/entities/task.dart';
import 'package:todolist/src/features/todos/domain/entities/database_failures/database_failure.dart';

abstract class ITasksRepository {
  Future<Either<DatabaseFailure, Unit>> createTask({required Task task});
  Future<Either<DatabaseFailure, List<Task>>> readTasks();
  Future<Either<DatabaseFailure, Unit>> updateTask({required Task task});
  Future<Either<DatabaseFailure, Unit>> deleteTask({required String taskId});
}
