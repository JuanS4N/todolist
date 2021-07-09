import 'package:flutter/material.dart';
import 'package:todolist/src/core/task_theme_data.dart';
import 'package:todolist/src/features/tasks/domain/entities/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
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
            child: _build(size, context),
          )
        : FadeTransition(
            opacity: animation,
            child: SizeTransition(
              sizeFactor: animation,
              axisAlignment: -1,
              child: _build(size, context),
            ),
          );
  }

  Widget _build(Size size, BuildContext context) {
    return Container(
      width: size.width * 0.9,
      margin: EdgeInsets.only(
          left: !task.subtasks.isNotEmpty && !task.completed
              ? size.width * 0.065
              : 0),
      child: InkWell(
        onTap: onTaskPressed,
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
              color: task.completed ? activeColor : null,
              onPressed: onIconPressed,
            ),
            Column(
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.5, vertical: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: unactiveColor),
                  ),
                  child: Text(
                    DateTime.now().toString(),
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
              ],
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
