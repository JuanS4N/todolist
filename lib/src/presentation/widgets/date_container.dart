import 'package:flutter/material.dart';
import 'package:todolist/src/core/utils.dart';

import '../../core/task_theme_data.dart';

class DateContainer extends StatelessWidget {
  DateContainer({
    Key? key,
    required this.date,
    required this.onPressed,
    this.borderRadius = 20.0,
    this.onDismiss,
  }) : super(key: key);

  final DateTime date;
  final double borderRadius;
  final Function(DateTime) onPressed;
  final Function()? onDismiss;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: () async {
          DateTime? newDate = await selectDateTime(context, currentDate: date);
          if (newDate == null) return;
          onPressed(newDate);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: unactiveColor),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                parseDateDMY(date),
                style: Theme.of(context).textTheme.caption,
              ),
              Visibility(
                visible: onDismiss != null,
                child: Container(
                  margin: EdgeInsets.only(left: 7.5),
                  child: InkWell(
                    onTap: onDismiss,
                    borderRadius: BorderRadius.circular(50),
                    child: Icon(Icons.clear_rounded, size: 14.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
