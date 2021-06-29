import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/src/features/todos/domain/entities/task.dart';
import 'package:todolist/src/features/todos/presentation/pages/home/logic/tasks_list_notifier.dart';
import 'package:todolist/src/features/todos/presentation/pages/home/logic/tasks_providers.dart';
import 'package:todolist/src/features/todos/presentation/pages/home/widgets/task_tile.dart';

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
      //final tasksProvider = watch(tasksListProvider);
      return SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Text(
                "List title",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            SliverAnimatedList(
              key: _uncompletedKey,
              initialItemCount: read.uncompletedTasks.length,
              itemBuilder: (context, index, animation) {
                Task task = read.uncompletedTasks[index];
                return TaskTile(
                  task: task,
                  animation: animation,
                  onChanged: () {
                    read.animatedTaskChange(
                      index,
                      task,
                      _uncompletedKey.currentState!,
                      _completedKey.currentState!,
                      TaskTile(task: task, animation: animation),
                    );
                  },
                );
              },
            ),
            SliverToBoxAdapter(
              child: Text(
                "Completed",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
              ),
            ),
            SliverAnimatedList(
              key: _completedKey,
              initialItemCount: read.completedTasks.length,
              itemBuilder: (context, index, animation) {
                Task task = read.completedTasks[index];
                return TaskTile(
                  task: task,
                  animation: animation,
                  onChanged: () {
                    read.animatedTaskChange(
                      index,
                      task,
                      _completedKey.currentState!,
                      _uncompletedKey.currentState!,
                      TaskTile(task: task, animation: animation),
                    );
                  },
                );
              },
            )
          ],
        ),
      );
    });

    // return Consumer(builder: (context, watch, child) {
    //   final tasksProvider = watch(tasksListProvider);
    //   final read = context.read(tasksListProvider);
    //   return ListView(
    //     children: [
    //       Text('List title'),
    //       Column(
    //         children: tasksProvider.uncompletedTasks
    //             .map(
    //               (task) => RadioListTile(
    //                 value: 0,
    //                 groupValue: 1,
    //                 onChanged: (_) => read.onTaskChanged(task),
    //                 title: Text(task.title),
    //               ),
    //             )
    //             .toList(),
    //       ),
    //       Text('Completed'),
    //       Column(
    //         children: tasksProvider.completedTasks
    //             .map(
    //               (task) => RadioListTile(
    //                 value: 0,
    //                 groupValue: 0,
    //                 selected: true,
    //                 toggleable: true,
    //                 onChanged: (_) => read.onTaskChanged(task),
    //                 title: Text(task.title),
    //               ),
    //             )
    //             .toList(),
    //       ),
    //     ],
    //   );
    // });
  }
}
