import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          onTap: () {
            context.read(listProvider).selectList(element);
            context
                .read(tasksNotifierProvider)
                .getTasks(selectedListId: element.listId.toString());
            // context.read(tasksListProvider).setTask(element);
            Navigator.pop(context);
            Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                pageBuilder: (BuildContext context, Animation<double> animation,
                        Animation<double> secondaryAnimation) =>
                    HomePage(),
                transitionDuration: const Duration(seconds: 1),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  final curvedAnimation = CurvedAnimation(
                      parent: animation, curve: Curves.easeInOut);
                  return FadeTransition(
                    opacity: Tween<double>(begin: 0.0, end: 1.0)
                        .animate(curvedAnimation),
                    child: child,
                  );
                },
              ),
            );
          },
        ));
  }
}
