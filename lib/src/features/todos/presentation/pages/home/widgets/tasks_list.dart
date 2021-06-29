import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../application/tasks_provider.dart';

import '../logic/tasks_providers.dart';
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
      final tasksNotifier = watch(tasksNotifierProvider);

      return SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Consumer(
                builder: (context, watch, child) {
                  final title = watch(tasksListProvider).title;
                  return Text(
                    title,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  );
                },
              ),
            ),
            AnimatedTasksList(
                myKey: _uncompletedKey,
                tasks: tasksNotifier.uncompletedTasks,
                onChanged: (task, index) {
                  read.animatedTaskChange(
                    index,
                    task,
                    _uncompletedKey.currentState!,
                    _completedKey.currentState!,
                  );
                }),
            SliverToBoxAdapter(
              child: Text(
                "Completed",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
              ),
            ),
            AnimatedTasksList(
                myKey: _completedKey,
                tasks: tasksNotifier.completedTasks,
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
