import 'package:dartz/dartz.dart';

import '../../../tasks/domain/entities/database_failures/database_failure.dart';
import '../entities/list_of_task.dart';

abstract class IListRepository {
  Future<Either<DatabaseFailure, Unit>> createList({required TaskList list});
  Future<Either<DatabaseFailure, List<TaskList>>> readAllList();
  Future<Either<DatabaseFailure, Unit>> updateList({required TaskList list});
}
