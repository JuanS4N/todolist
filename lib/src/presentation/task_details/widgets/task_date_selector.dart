import 'package:flutter/material.dart';
import 'package:todolist/src/core/utils.dart';
import 'package:todolist/src/presentation/task_details/widgets/icon_prefix_widget.dart';
import 'package:todolist/src/presentation/widgets/date_container.dart';

class TaskDateSelector extends StatelessWidget {
  const TaskDateSelector({
    Key? key,
    required this.onChange,
    required this.onDismiss,
    this.date,
  }) : super(key: key);

  final DateTime? date;
  final Function(DateTime) onChange;
  final Function() onDismiss;
  @override
  Widget build(BuildContext context) {
    bool hasDate = date != null;
    return InkWell(
      onTap: hasDate
          ? null
          : () async {
              DateTime? newDate =
                  await selectDateTime(context, currentDate: date);
              if (newDate == null) return;
              onChange(newDate);
            },
      child: IconPrefixWidget(
        icon: Icons.event_available,
        crossAxisAlignment: CrossAxisAlignment.center,
        child: date == null
            ? Text('Agregar fecha/hora')
            : DateContainer(
                date: date!,
                onPressed: onChange,
                onDismiss: onDismiss,
              ),
      ),
    );
  }
}
