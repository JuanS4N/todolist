import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../domain/contracts/i_repositories.dart';
import '../domain/entities/list_of_task.dart';

class ListNotifier extends ChangeNotifier {
  final IListRepository repository;

  List<TaskList> _taskLists = List<TaskList>.empty();

  ListNotifier({required this.repository});

  List<TaskList> get taskLists => _taskLists;

  TaskList get selectedList => _taskLists.firstWhere((list) => list.isActive);

  String get selectedListId => selectedList.listId.toString();

  Future<List<TaskList>> fetchTaskList() async {
    var result = await repository.readAllList();

    _taskLists = result.fold((l) => List<TaskList>.empty(), (r) => r);
    notifyListeners();

    return _taskLists;
  }

  Future<void> selectList(TaskList taskList) async {
    await repository.updateList(list: taskList.copyWith(isActive: true));

    _taskLists.forEach((element) async {
      if (element.isActive) {
        await repository.updateList(list: element.copyWith(isActive: false));
      }
    });

    await fetchTaskList();
  }

  Future createList(String newListName) async {
    await repository.createList(list: TaskList.namedList(newListName));
    await fetchTaskList();
    await selectList(
        _taskLists.firstWhere((element) => element.listName == newListName));
  }

  Future renameList(String listname) async {
    await repository.updateList(
        list: selectedList.copyWith(listName: listname));
    await fetchTaskList();
  }

  Future delete() async {
    await repository.deleteList(list: selectedList);
    await selectList(_taskLists.firstWhere((element) => element.isDefaultList));
  }
}
