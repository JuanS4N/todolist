import 'package:flutter/material.dart';

class ConfirmDeletionDialog extends StatelessWidget {
  final String taskNumber;
  final void Function() onDelete;

  const ConfirmDeletionDialog({
    Key? key,
    required this.taskNumber,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Delete this list?"),
      content: Text("Deleting this will also delete $taskNumber tasks"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel")),
        TextButton(onPressed: onDelete, child: Text("Delete")),
      ],
    );
  }
}
