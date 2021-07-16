import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todolist/src/features/List/domain/contracts/i_repositories.dart';

import '../domain/entities/list_of_task.dart';

class ListNotifier extends ChangeNotifier {
  final IListRepository repository;

  ListNotifier({required this.repository});

  List<TaskList> _myList = [
    TaskList(1, 'Oh', false),
    TaskList(2, 'My', true),
    TaskList(3, 'Gosh', false),
    TaskList(4, 'It Works!', false),
  ];

  get myLisy => _myList;

  Future<List<TaskList>> get taskList async {
    final result = await this.repository.readAllList();

    return result.fold((failure) {
      // TODO -> Handle the error
      print(failure.toString());
      return new List.empty();
    }, (r) => r);
  }

  void createList(String name) {}

  void selectList(TaskList task) {
    _myList.forEach((element) {
      if (element.isActive) {
        element.isActive = false;
      }

      if (element.listId == task.listId) {
        element.isActive = true;
      }
    });
    notifyListeners();
  }
}
