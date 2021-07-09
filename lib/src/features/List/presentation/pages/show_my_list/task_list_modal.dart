import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/list_providers.dart';
import '../../widgets/create_list_cta.dart';
import '../../widgets/items_list_viewer.dart';

void listViewBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // TODO -> We need to stop when al task are displyed.
      builder: (BuildContext bc) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.30,
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
            final innerList = watch(listProvider).myLisy;
            return Expanded(child: ItemsListView(innerList, controller));
          }),
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
