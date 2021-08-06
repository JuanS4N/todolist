import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/src/features/list/application/list_providers.dart';

import '../../../core/utils.dart';
import '../../../features/tasks/application/tasks_provider.dart';
import '../logic/tasks_providers.dart';
import 'completed_tasks_list.dart';
import 'uncompleted_tasks_list.dart';

class TasksListBody extends StatefulWidget {
  TasksListBody({Key? key}) : super(key: key);

  @override
  _TasksListBodyState createState() => _TasksListBodyState();
}

class _TasksListBodyState extends State<TasksListBody> {
  final _uncompletedKey = GlobalKey<SliverAnimatedListState>();
  // final _completedKey = GlobalKey<SliverAnimatedListState>();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (contex, watch, child) {
        final read = context.read(tasksListProvider);
        final listProv = contex.read(listProvider);
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
                  child: Text(listProv.selectedList.listName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline4),
                ),
              ),
              UncompletedTasksList(
                myKey: _uncompletedKey,
                tasks: tasksNotifier.uncompletedTasks,
                onCompletedTask: (task, index) => read.completeTask(
                  index,
                  task,
                  _uncompletedKey.currentState!,
                ),
              ),
              SliverToBoxAdapter(
                child: CompletedTasksList(
                  completedTasks: tasksNotifier.completedTasks,
                  onChanged: (task, index) =>
                      read.uncompleteTask(task, _uncompletedKey.currentState!),
                  onExpansionChanged: (expanded) {
                    if (expanded)
                      Future.delayed(Duration(milliseconds: 100), () {
                        _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
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
