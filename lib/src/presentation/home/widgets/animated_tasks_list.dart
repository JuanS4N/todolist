import 'package:flutter/material.dart';
import 'package:todolist/src/features/tasks/domain/entities/task.dart';
import 'package:todolist/src/presentation/task_details/task_page.dart';
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
          onIconPressed: () {
            onChanged(task, index);
          },
          onTaskPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => TaskPage(task: task)),
            );
          },
        );
      },
    );
  }
}
