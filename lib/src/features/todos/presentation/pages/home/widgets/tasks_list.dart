import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/src/features/todos/presentation/pages/home/logic/tasks_providers.dart';

class TasksList extends StatelessWidget {
  TasksList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final tasksProvider = watch(tasksListProvider);
      final read = context.read(tasksListProvider);
      return ListView(
        children: [
          Text('List title'),
          Column(
            children: tasksProvider.uncompletedTasks
                .map(
                  (task) => RadioListTile(
                    value: 0,
                    groupValue: 1,
                    onChanged: (_) => read.onTaskChanged(task),
                    title: Text(task.title),
                  ),
                )
                .toList(),
          ),
          Text('Completed'),
          Column(
            children: tasksProvider.completedTasks
                .map(
                  (task) => RadioListTile(
                    value: 0,
                    groupValue: 0,
                    selected: true,
                    toggleable: true,
                    onChanged: (_) => read.onTaskChanged(task),
                    title: Text(task.title),
                  ),
                )
                .toList(),
          ),
        ],
      );
    });
  }
}
