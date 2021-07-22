import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/src/core/utils.dart';
import 'package:todolist/src/presentation/home/widgets/completed_tasks_list.dart';

import '../../../features/tasks/application/tasks_provider.dart';
import '../logic/tasks_providers.dart';
import 'uncompleted_tasks_list.dart';

class TasksList extends StatefulWidget {
  TasksList({Key? key}) : super(key: key);

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  final _uncompletedKey = GlobalKey<SliverAnimatedListState>();
  // final _completedKey = GlobalKey<SliverAnimatedListState>();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (contex, watch, child) {
        final read = context.read(tasksListProvider);
        final tasksNotifier = watch(tasksNotifierProvider);

        return SafeArea(
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(
                    left: contextSize(context).width * 0.1,
                    right: contextSize(context).width * 0.1,
                    bottom: 15.0,
                  ),
                  child: Text('List title name',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline4),
                ),
              ),
              UncompletedTasksList(
                myKey: _uncompletedKey,
                tasks: tasksNotifier.uncompletedTasks,
                onChanged: (task, index) => read.completeTask(
                  index,
                  task,
                  _uncompletedKey.currentState!,
                  // _completedKey.currentState!,
                ),
              ),
              SliverToBoxAdapter(
                child: CompletedTasksList(
                  completedTasks: tasksNotifier.completedTasks,
                  onChanged: (task, index) => read.uncompleteTask(
                      index, task, _uncompletedKey.currentState!),
                  onExpansionChanged: (expanded) {
                    if (expanded)
                      Future.delayed(Duration(milliseconds: 100), () {
                        _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            // contextSize(context).height * 0.2,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeOut);
                      });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
