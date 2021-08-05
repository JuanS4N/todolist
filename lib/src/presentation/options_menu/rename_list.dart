import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/src/presentation/create_view/create_view.dart';

import '../../features/list/application/list_providers.dart';

class RenameListView extends StatelessWidget {
  const RenameListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listProv = context.read(listProvider);

    return CreateBody(
      startWithInput: listProv.selectedList.listName,
      actionName: 'Rename list',
      hintText: 'Insert new list name',
      onDonePressed: (String value) {
        var listProv = context.read(listProvider);
        print(value);
        listProv.renameList(value);
      },
    );
  }
}
