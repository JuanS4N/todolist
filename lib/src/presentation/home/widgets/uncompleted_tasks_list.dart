import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../logic/tasks_providers.dart';
import '../../../features/tasks/domain/entities/task.dart';
import '../../task_details/pages/task_page.dart';
import 'uncompleted_task_tile.dart';

class UncompletedTasksList extends StatelessWidget {
  const UncompletedTasksList({
    Key? key,
    required this.tasks,
    required this.onCompletedTask,
    myKey,
  })  : _myKey = myKey,
        super(key: key);

  final GlobalKey<SliverAnimatedListState> _myKey;
  final List<Task> tasks;
  final Function(Task task, int index) onCompletedTask;

  @override
  Widget build(BuildContext context) {
    return SliverAnimatedList(
      key: _myKey,
      initialItemCount: tasks.length,
      itemBuilder: (context, index, animation) {
        Task task = tasks[index];
        return UncompletedTaskTile(
          task: task,
          animation: animation,
          onIconPressed: () {
            onCompletedTask(task, index);
          },
          onTaskPressed: () async {
            final result = await Navigator.push<Task>(
              context,
              MaterialPageRoute(builder: (_) => TaskPage(task: task)),
            );
            if (result != task) print(result);
          },
          onDateChanged: (DateTime newDate) async {
            await context
                .read(tasksListProvider)
                .updateTask(task.copyWith(date: newDate));
            // onChanged(task.copyWith(date: newDate), index);
          },
        );
      },
    );
  }
}
