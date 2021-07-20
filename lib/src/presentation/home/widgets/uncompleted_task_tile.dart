import 'package:flutter/material.dart';

import '../../../core/task_theme_data.dart';
import '../../../features/tasks/domain/entities/task.dart';
import '../../widgets/date_container.dart';

class UncompletedTaskTile extends StatelessWidget {
  const UncompletedTaskTile({
    Key? key,
    required this.task,
    required this.animation,
    this.onIconPressed,
    this.onTaskPressed,
    this.datePick,
  }) : super(key: key);

  final Task task;
  final Animation<double> animation;
  final Function()? onIconPressed;
  final Function()? onTaskPressed;
  final Function()? datePick;
  //final bool titleOnly;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return onIconPressed != null
        ? SizeTransition(
            sizeFactor: animation,
            axisAlignment: 1,
            child: _build(
              size,
              context,
              isSubtask: task.parentTask != null, //&& !task.completed,
            ),
          )
        : FadeTransition(
            opacity: animation,
            child: SizeTransition(
              sizeFactor: animation,
              axisAlignment: -1,
              child: _build(
                size,
                context,
                isSubtask: false,
              ),
            ),
          );
  }

  Widget _build(Size size, BuildContext context, {required bool isSubtask}) {
    return InkWell(
      onTap: onTaskPressed,
      child: Container(
        padding: isSubtask ? EdgeInsets.only(left: size.width * 0.065) : null,
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.015, vertical: 7.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                task.completed ? Icons.check : Icons.circle_outlined,
              ),
              visualDensity: VisualDensity.compact,
              onPressed: onIconPressed,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    maxLines: 5,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Visibility(
                    visible: task.description != null,
                    child: _descriptionBuilder(size, context),
                  ),
                  DateContainer(
                    date: DateTime.now(),
                    onPressed: (DateTime date) {
                      print(date.toString());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _descriptionBuilder(Size size, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      width: size.width * 0.7,
      child: Text(
        task.description ?? '',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
