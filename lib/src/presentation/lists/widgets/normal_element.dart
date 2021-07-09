import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/src/features/List/application/list_providers.dart';
import 'package:todolist/src/features/List/domain/entities/list_of_task.dart';

class NormalElement extends StatelessWidget {
  final TaskList element;
  final EdgeInsets outerMargin;
  const NormalElement(this.element, this.outerMargin, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(margin: outerMargin, child: listTileForElement(context));
  }

  Widget listTileForElement(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 55),
        child: ListTile(
          title: Text(
            element.listName,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          onTap: () {
            context.read(listProvider).selectList(element);
            // context.read(tasksListProvider).setTask(element);
            Navigator.pop(context);
          },
        ));
  }
}
