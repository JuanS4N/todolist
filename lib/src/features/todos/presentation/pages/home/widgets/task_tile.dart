import 'package:flutter/material.dart';
import 'package:todolist/src/features/todos/domain/entities/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
    required this.animation,
    this.onChanged,
  }) : super(key: key);

  final Task task;
  final Animation<double> animation;
  final Function()? onChanged;

  @override
  Widget build(BuildContext context) {
    Tween<Offset> _myTween = Tween(begin: Offset(1, 0), end: Offset(0, 0));
    return SlideTransition(
      position: animation.drive(_myTween),
      child: _build(),
    );
  }

  RadioListTile<int> _build() {
    return RadioListTile(
        value: task.completed ? 1 : 0,
        groupValue: 1,
        toggleable: true,
        title: Text(task.title),
        onChanged: onChanged != null
            ? (value) {
                onChanged!();
              }
            : null);
  }
}
