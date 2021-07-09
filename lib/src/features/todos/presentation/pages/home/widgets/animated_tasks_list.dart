import 'package:flutter/material.dart';

import '../../../../domain/entities/task.dart';
import 'task_tile.dart';

class AnimatedTasksList extends StatelessWidget {
  const AnimatedTasksList({
    Key? key,
    required this.tasks,
    required this.onChanged,
    myKey,
  })  : _myKey = myKey,
        super(key: key);

  final GlobalKey<SliverAnimatedListState> _myKey;
  final List<Task> tasks;
  final Function(Task task, int index) onChanged;

  @override
  Widget build(BuildContext context) {
    return SliverAnimatedList(
      key: _myKey,
      initialItemCount: tasks.length,
      itemBuilder: (context, index, animation) {
        Task task = tasks[index];
        return TaskTile(
            task: task,
            animation: animation,
            onChanged: () {
              onChanged(task, index);
            });
      },
    );
  }
}
