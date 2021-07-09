import 'package:flutter/material.dart';

import '../../domain/entities/list_of_task.dart';
import 'list_element.dart';

class ItemsListView extends StatelessWidget {
  final List<TaskList> listItems;
  final ScrollController controller;

  const ItemsListView(this.listItems, this.controller, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: controller,
        itemBuilder: (context, index) {
          return ListElement(listItems[index]);
        },
        itemCount: listItems.length);
  }
}
