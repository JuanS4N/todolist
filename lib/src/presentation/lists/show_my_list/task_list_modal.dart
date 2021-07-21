import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/src/features/List/application/list_providers.dart';
import 'package:todolist/src/features/List/domain/entities/list_of_task.dart';
import 'package:todolist/src/presentation/lists/widgets/create_list_cta.dart';
import 'package:todolist/src/presentation/lists/widgets/items_list_viewer.dart';

void listViewBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // TODO -> We need to stop when al task are displyed.
      builder: (BuildContext bc) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.30,
          maxChildSize: 0.9,
          builder: (_, scrollController) {
            return SafeArea(child: TaskListView(scrollController));
          },
        ); //SafeArea(child: ListViewer());
      });
}

class TaskListView extends StatelessWidget {
  final ScrollController controller;
  const TaskListView(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Consumer(builder: (context, watch, child) {
            final listItems = watch(listProvider).taskLists;
            return Expanded(child: ItemsListView(listItems, controller));
          }),
          //}),
          Divider(
            thickness: 1,
            color: Colors.black26,
          ),
          CreateListCTA()
        ],
      ),
    );
  }
}
