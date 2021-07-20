import 'package:flutter/material.dart';
import '../../../features/tasks/domain/entities/task.dart';
import '../../task_details/pages/task_page.dart';
import 'uncompleted_task_tile.dart';

class UncompletedTasksList extends StatelessWidget {
  const UncompletedTasksList({
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
        return UncompletedTaskTile(
          task: task,
          animation: animation,
          onIconPressed: () {
            onChanged(task, index);
          },
          onTaskPressed: () async{
            final result = await Navigator.push<Task>(
              context,
              MaterialPageRoute(builder: (_) => TaskPage(task: task)),
            );
            if(result != null) print(result);
          },
        );
      },
    );
  }
}
