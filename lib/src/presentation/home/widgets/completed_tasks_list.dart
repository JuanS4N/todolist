import 'package:flutter/material.dart';
import '../../../features/tasks/domain/entities/task.dart';
import 'completed_task_tile.dart';
import '../../task_details/pages/task_page.dart';

class CompletedTasksList extends StatelessWidget {
  const CompletedTasksList({
    Key? key,
    required this.onExpansionChanged,
    required this.completedTasks,
    required this.onChanged,
  }) : super(key: key);

  final Function(bool expanded) onExpansionChanged;
  final List<Task> completedTasks;
  final Function(Task task, int index) onChanged;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: completedTasks.isEmpty
          ? Container()
          : ExpansionTile(
              title: Text('Completed'),
              onExpansionChanged: onExpansionChanged,
              children: _childrenBuilder(context),
            ),
    );
  }

  List<Widget> _childrenBuilder(context) {
    List<Widget> children = [];
    for (int i = 0; i < completedTasks.length; i++) {
      Task _task = completedTasks[i];
      children.add(
        CompletedTaskTile(
          task: _task,
          onIconPressed: () {
            onChanged(_task, i);
          },
          onTaskPressed: () async {
            final result = await Navigator.push<Task>(
              context,
              MaterialPageRoute(builder: (_) => TaskPage(task: _task)),
            );
            if (result != null) print(result);
          },
        ),
      );
    }
    completedTasks.forEach((_task) {});
    return children;
  }
}
