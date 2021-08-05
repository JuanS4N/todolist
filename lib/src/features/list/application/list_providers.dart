import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/contracts/i_repositories.dart';
import '../repositories/hive_list_repository.dart';
import 'list_notifier.dart';

// import 'list_notifier.dart';

final listLocalRepositoryProvider = Provider((ref) => new HiveListRepository());

final listProvider = ChangeNotifierProvider<ListNotifier>((ref) {
  final IListRepository repository = ref.watch(listLocalRepositoryProvider);
  return ListNotifier(repository: repository);
});
