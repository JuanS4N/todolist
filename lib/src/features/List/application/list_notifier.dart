import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todolist/src/features/List/domain/contracts/i_repositories.dart';

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

  void createList() async {
    print("Lets create it!");
    await repository.createList(list: TaskList.namedList(_listName));

    print("Lets check...");
    await repository.readAllList();
  }
}

class ListNotifier extends ChangeNotifier {
  final IListRepository repository;

  List<TaskList> _taskLists = List<TaskList>.empty();

  ListNotifier({required this.repository});

  List<TaskList> get taskLists => _taskLists;

  Future<List<TaskList>> fetchTaskList() async {
    var result = await repository.readAllList();

    _taskLists = result.fold((l) => List<TaskList>.empty(), (r) => r);
    notifyListeners();

    return _taskLists;
  }

  Future<List<TaskList>> get taskList {
    return this
        .repository
        .readAllList()
        .then((result) => result.fold((failure) {
              print("it crash !" + failure.toString());
              return new List.empty();
            }, (r) => r));
  }

  void selectList(TaskList taskList) async {
    await repository.updateList(list: taskList.copyWith(isActive: true));

    _taskLists.forEach((element) async {
      if (element.isActive) {
        await repository.updateList(list: element.copyWith(isActive: false));
      }
    });
    notifyListeners();
  }
}
