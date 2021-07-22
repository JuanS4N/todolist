import 'package:dartz/dartz.dart';

import '../../../list/domain/entities/list_of_task.dart';
import '../../../tasks/domain/entities/database_failures/database_failure.dart';

abstract class IListRepository {
  Future<Either<DatabaseFailure, Unit>> createList({required TaskList list});
  Future<Either<DatabaseFailure, List<TaskList>>> readAllList();
  Future<Either<DatabaseFailure, Unit>> updateList({required TaskList list});
}
