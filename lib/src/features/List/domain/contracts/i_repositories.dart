import 'package:dartz/dartz.dart';
import 'package:todolist/src/features/List/domain/entities/list_of_task.dart';
import 'package:todolist/src/features/tasks/domain/entities/database_failures/database_failure.dart';

abstract class IListRepository {
  Future<Either<DatabaseFailure, Unit>> createList({required TaskList list});
  Future<Either<DatabaseFailure, List<TaskList>>> readAllList();
}
