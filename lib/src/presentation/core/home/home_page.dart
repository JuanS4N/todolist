import 'package:flutter/material.dart';

import '../../../features/todos/presentation/pages/home/widgets/tasks_list.dart';
import 'widgets/home_bottom_app_bar.dart';
import 'widgets/home_fab.dart';

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
