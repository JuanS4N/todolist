import 'package:flutter/material.dart';

import 'create_task_form_body.dart';

void createListModal(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext buildContext) {
        return CreateTaskForm();
      });
}

class CreateTaskForm extends StatelessWidget {
  const CreateTaskForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: SafeArea(child: CreateTaskFormBody()),
    );
  }
}
