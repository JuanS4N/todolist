import 'package:flutter/material.dart';
import 'package:todolist/src/core/utils.dart';
import 'package:todolist/src/presentation/task_details/widgets/icon_prefix_widget.dart';

class DateTimeDialog extends StatefulWidget {
  const DateTimeDialog({
    Key? key,
  }) : super(key: key);

  @override
  _DateTimeDialogState createState() => _DateTimeDialogState();
}

class _DateTimeDialogState extends State<DateTimeDialog> {
  final currentYear = DateTime(DateTime.now().year);

  late DateTime _date;
  TimeOfDay? _time;

  @override
  void initState() {
    super.initState();
    _date = DateTime.now();
    // _time = TimeOfDay.fromDateTime(_date);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.5),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: contextSize(context).width * 0.01),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              color: Colors.transparent,
              child: CalendarDatePicker(
                initialDate: _date,
                firstDate: DateTime.now(),
                currentDate: _date,
                lastDate: currentYear.add(Duration(days: 365)),
                onDateChanged: (DateTime value) {
                  setState(() {
                    _date = value;
                  });
                },
              ),
            ),
            InkWell(
              onTap: () async {
                final newTime = await showTimePicker(
                  context: context,
                  initialEntryMode: TimePickerEntryMode.dial,
                  initialTime: _time ?? TimeOfDay.fromDateTime(_date),
                );

                if (newTime == null) return;

                setState(() {
                  _time = newTime;
                });
              },
              child: IconPrefixWidget(
                icon: Icons.schedule,
                spaceBetween: 10.0,
                crossAxisAlignment: CrossAxisAlignment.center,
                margin: EdgeInsets.symmetric(
                    horizontal: contextSize(context).width * 0.045,
                    vertical: 5.0),
                child: Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.5),
                    child: Text(_time?.format(context) ?? 'Sample text'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: contextSize(context).width * 0.035),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancelar'),
                  ),
                  SizedBox(width: contextSize(context).width * 0.05),
                  TextButton(
                    onPressed: () {
                      DateTime finalDate = DateTime(_date.year, _date.month,
                          _date.day, _time?.hour ?? 0, _time?.minute ?? 0);
                      Navigator.pop(context, finalDate);
                    },
                    child: Text('Listo'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
