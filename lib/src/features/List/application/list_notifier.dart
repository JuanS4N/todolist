import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../domain/contracts/i_repositories.dart';
import '../domain/entities/list_of_task.dart';

class CreateListNotifier extends ChangeNotifier {
  final IListRepository repository;

  CreateListNotifier({required this.repository});

  String _listName = "";
  bool isNamedCorrectly = false;

  set listName(String value) {
    this._listName = value;
    isNamedCorrectly = couldCreateList();
    notifyListeners();
  }

  void cleanState() {
    this._listName = "";
    this.isNamedCorrectly = false;
  }

  bool couldCreateList() {
    if (_listName.length > 0) {
      return true;
    }
    return false;
  }

  Future createList() async {
    await repository.createList(list: TaskList.namedList(_listName));
  }
}

class ListNotifier extends ChangeNotifier {
  final IListRepository repository;

  List<TaskList> _taskLists = List<TaskList>.empty();

  ListNotifier({required this.repository});

  List<TaskList> get taskLists => _taskLists;

  String get selectedListId =>
      _taskLists.firstWhere((list) => list.isActive).listId.toString();

  Future<List<TaskList>> fetchTaskList() async {
    var result = await repository.readAllList();

    _taskLists = result.fold((l) => List<TaskList>.empty(), (r) => r);
    notifyListeners();

    return _taskLists;
  }

  void selectList(TaskList taskList) async {
    await repository.updateList(list: taskList.copyWith(isActive: true));

    _taskLists.forEach((element) async {
      if (element.isActive) {
        await repository.updateList(list: element.copyWith(isActive: false));
      }
    });

    await fetchTaskList();
  }
}
