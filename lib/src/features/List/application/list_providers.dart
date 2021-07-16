import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/src/features/List/domain/contracts/i_repositories.dart';
import 'package:todolist/src/features/List/repositories/hive_list_repository.dart';

import 'list_notifier.dart';

final listLocalRepositoryProvider = Provider((ref) => new HiveListRepository());

final listProvider = ChangeNotifierProvider<ListNotifier>((ref) {
  final IListRepository repository = ref.watch(listLocalRepositoryProvider);
  return ListNotifier(repository: repository);
});
