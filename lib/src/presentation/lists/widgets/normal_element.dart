import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/src/presentation/splash/splash_screen_page.dart';
import 'package:todolist/src/presentation/widgets/refresh_home.dart';

import '../../../features/list/application/list_providers.dart';
import '../../../features/list/domain/entities/list_of_task.dart';
import '../../../features/tasks/application/tasks_provider.dart';
import '../../home/home_page.dart';

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
            style: Theme.of(context).textTheme.bodyText1,
          ),
          onTap: () async {
            context.read(listProvider).selectList(element);
            context
                .read(tasksNotifierProvider)
                .getTasks(selectedListId: element.listId.toString());
            // context.read(tasksListProvider).setTask(element);
            Navigator.pop(context);
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SplashScreenPage()));
          },
        ));
  }
}
