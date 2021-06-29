import 'package:flutter/material.dart';
import 'package:todolist/src/presentation/core/home/widgets/home_bottom_app_bar.dart';
import 'package:todolist/src/presentation/core/home/widgets/home_fab.dart';
import 'package:todolist/src/features/todos/presentation/pages/home/widgets/tasks_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TasksList(),
      bottomNavigationBar: HomeBottomAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: HomeFAB(),
    );
  }
}
