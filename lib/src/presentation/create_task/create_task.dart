import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/src/features/tasks/application/tasks_provider.dart';
import 'create_task_form_body.dart';

void createListModal(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      builder: (BuildContext buildContext) {
        return CreateTaskForm();
      });
}

class CreateTaskForm extends StatelessWidget {
  const CreateTaskForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createTaskProv = context.read(createTaskProvider);
    return WillPopScope(
      onWillPop: () async {
        createTaskProv.resetValues();
        return true;
      },
      child: CreateTaskFormBody(),
    );
  }
}
