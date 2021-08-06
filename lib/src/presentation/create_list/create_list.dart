import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/src/presentation/create_view/create_view.dart';

import '../../features/list/application/list_providers.dart';

class CreateListView extends StatelessWidget {
  const CreateListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CreateBody(
      actionName: 'Create a list',
      hintText: 'List name',
      onDonePressed: (String value) {
        var listProv = context.read(listProvider);
        print(value);
        listProv.createList(value);
      },
    );
  }
}
