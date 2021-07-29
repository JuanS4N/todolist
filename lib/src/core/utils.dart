import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/src/presentation/widgets/date_time_dialog.dart';
import 'package:flutter/services.dart';

Size contextSize(BuildContext context) => MediaQuery.of(context).size;

String parseDateDMY(DateTime date) {
  final DateFormat formatter = DateFormat('EEE, MMM d, ' 'yyyy');
  return formatter.format(date);
}

Future<DateTime?> selectDateTime(BuildContext context,
    {DateTime? currentDate}) async {
  await SystemChannels.textInput.invokeMethod('TextInput.hide');
  DateTime? newDate = await showDialog<DateTime>(
    context: context,
    useSafeArea: true,
    builder: (context) {
      return DateTimeDialog(date: currentDate);
    },
  );
  // if (newDate == null) return;
  return newDate;
}
