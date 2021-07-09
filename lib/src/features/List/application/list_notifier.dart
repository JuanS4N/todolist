import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../domain/entities/list_of_task.dart';

class ListNotifier extends ChangeNotifier {
  List<TaskList> _myList = [
    TaskList(1, 'Oh', false),
    TaskList(2, 'My', true),
    TaskList(3, 'Gosh', false),
    TaskList(4, 'It Works!', false),
  ];

  get myLisy => _myList;

  void setList(listParam) {
    this._myList = listParam;
    notifyListeners();
  }

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
