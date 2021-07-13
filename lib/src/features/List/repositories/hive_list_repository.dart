import 'package:todolist/src/features/tasks/domain/entities/task.dart';
import 'package:todolist/src/features/tasks/domain/entities/database_failures/database_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:todolist/src/features/tasks/domain/interface/i_tasks_repository.dart';

class HiveListRepository extends ITasksRepository {
  @override
  Future<Either<DatabaseFailure, Unit>> createTask({required Task task}) {
    // TODO: implement createTask
    throw UnimplementedError();
  }

  @override
  Future<Either<DatabaseFailure, Unit>> deleteTask({required String taskId}) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<Either<DatabaseFailure, List<Task>>> readTasks() {
    // TODO: implement readTasks
    throw UnimplementedError();
  }

  @override
  Future<Either<DatabaseFailure, Unit>> updateTask({required Task task}) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
