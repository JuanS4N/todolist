import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/src/features/list/application/list_providers.dart';
import 'package:todolist/src/features/tasks/application/tasks_provider.dart';
import 'package:todolist/src/features/tasks/domain/entities/task.dart';

class HomeFAB extends ConsumerWidget {
  const HomeFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return FloatingActionButton(
      onPressed: () async {
        final String listId = context.read(listProvider).selectedListId;
        Task parentTask = Task(
            title: 'Task32 - Segunda lista',
            modified: DateTime.now(),
            date: DateTime(2021, 8, 12),
            description: 'Task description',
            listId: listId);
        await Future.delayed(Duration(milliseconds: 2));
        final subtask1 = Task(
          title: 'Subtask 1 P8',
          parentTask: parentTask.id,
          listId: listId,
        );
        // await Future.delayed(Duration(milliseconds: 2));
        // final subtask2 = Task(title: 'Subtask 2 P8', parentTask: parentTask.id);
        // await Future.delayed(Duration(milliseconds: 2));
        // final subtask3 = Task(title: 'Subtask 3 P8', parentTask: parentTask.id);
        parentTask = parentTask
            .copyWith(subtasks: [subtask1.id]); //, subtask2.id, subtask3.id]);
        // await context.read(tasksNotifierProvider).createTask(task: subtask3);
        // await context.read(tasksNotifierProvider).createTask(task: subtask2);
        await context.read(tasksNotifierProvider).createTask(task: subtask1);
        await context
            .read(tasksNotifierProvider)
            .createTask(task: parentTask)
            .then((value) => log('exit'));
      },
      child: Icon(Icons.add),
      elevation: 0.0,
    );
  }
}
