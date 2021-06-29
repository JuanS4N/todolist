import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/src/features/todos/domain/entities/task.dart';
import 'package:todolist/src/features/todos/presentation/pages/home/logic/tasks_list_notifier.dart';
import 'package:todolist/src/features/todos/presentation/pages/home/logic/tasks_providers.dart';
import 'package:todolist/src/features/todos/presentation/pages/home/widgets/task_tile.dart';

import 'animated_tasks_list.dart';

class TasksList extends StatefulWidget {
  TasksList({Key? key}) : super(key: key);

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  final _uncompletedKey = GlobalKey<SliverAnimatedListState>();
  final _completedKey = GlobalKey<SliverAnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (contex, watch, child) {
      final read = context.read(tasksListProvider);
      final tasksProvider = watch(tasksListProvider);

      return SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Text(
                "List title",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            AnimatedTasksList(
                myKey: _uncompletedKey,
                tasks: tasksProvider.uncompletedTasks,
                onChanged: (task, index) {
                  read.animatedTaskChange(
                    index,
                    task,
                    _uncompletedKey.currentState!,
                    _completedKey.currentState!,
                  );
                }),
            // SliverAnimatedList(
            //   key: _uncompletedKey,
            //   initialItemCount: read.uncompletedTasks.length,
            //   itemBuilder: (context, index, animation) {
            //     Task task = read.uncompletedTasks[index];
            //     return TaskTile(
            //       task: task,
            //       animation: animation,
            //       onChanged: () {
            //         read.animatedTaskChange(
            //           index,
            //           task,
            //           _uncompletedKey.currentState!,
            //           _completedKey.currentState!,
            //         );
            //       },
            //     );
            //   },
            // ),
            SliverToBoxAdapter(
              child: Text(
                "Completed",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
              ),
            ),
            AnimatedTasksList(
                myKey: _completedKey,
                tasks: tasksProvider.completedTasks,
                onChanged: (task, index) {
                  read.animatedTaskChange(
                    index,
                    task,
                    _completedKey.currentState!,
                    _uncompletedKey.currentState!,
                  );
                }),
          ],
        ),
      );
    });
  }
}
