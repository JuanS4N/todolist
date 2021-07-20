import 'package:flutter/material.dart';
import 'package:todolist/src/core/task_theme_data.dart';
import 'package:todolist/src/core/utils.dart';
import 'package:todolist/src/features/tasks/domain/entities/task.dart';

class CompletedTaskTile extends StatelessWidget {
  const CompletedTaskTile({
    Key? key,
    required this.task,
    required this.onIconPressed,
    required this.onTaskPressed,
  }) : super(key: key);

  final Task task;
  final Function() onIconPressed;
  final Function() onTaskPressed;
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTaskPressed,
      contentPadding: EdgeInsets.symmetric(horizontal: contextSize(context).width * 0.015),
      visualDensity: VisualDensity.compact,
      leading: IconButton(
        icon: Icon(
          task.completed ? Icons.check : Icons.circle_outlined,
        ),
        visualDensity: VisualDensity.compact,
        color: activeColor,
        onPressed: onIconPressed,
      ),
      title: Text(task.title),
      subtitle: task.description == null ? null : Text(task.description ?? ''),
    );
  }
}
