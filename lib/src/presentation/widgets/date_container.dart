import 'package:flutter/material.dart';
import 'package:todolist/src/core/utils.dart';
import 'package:todolist/src/presentation/task_details/widgets/icon_prefix_widget.dart';
import 'package:todolist/src/presentation/widgets/date_time_dialog.dart';

import '../../core/task_theme_data.dart';

class DateContainer extends StatelessWidget {
  DateContainer({
    Key? key,
    required this.date,
    required this.onPressed,
    this.borderRadius = 20.0,
  }) : super(key: key);

  final DateTime date;
  final double borderRadius;
  final Function(DateTime) onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: () async {
          DateTime? newDate = await showDialog<DateTime>(
            context: context,
            useSafeArea: true,
            builder: (context) {
              return DateTimeDialog();
            },
          );
          if(newDate == null) return;

          print(newDate);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: unactiveColor),
          ),
          child: Text(
            parseDateDMY(date),
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      ),
    );
  }
}
