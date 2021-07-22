import 'package:flutter/material.dart';
import 'package:todolist/src/core/utils.dart';
import 'package:todolist/src/presentation/task_details/widgets/icon_prefix_widget.dart';

class DateTimeDialog extends StatefulWidget {
  const DateTimeDialog({
    Key? key,
    this.date,
  }) : super(key: key);

  final DateTime? date;

  @override
  _DateTimeDialogState createState() => _DateTimeDialogState();
}

class _DateTimeDialogState extends State<DateTimeDialog> {
  final currentYear = DateTime(DateTime.now().year);

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  void initState() {
    super.initState();
    if (widget.date != null) {
      selectedDate =
          DateTime(widget.date!.year, widget.date!.month, widget.date!.day);
      selectedTime = TimeOfDay.fromDateTime(widget.date!);
    } else {
      // _date = DateTime.now();
      // _time = TimeOfDay.fromDateTime(_date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.5),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: 15.0, horizontal: contextSize(context).width * 0.01),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              color: Colors.transparent,
              child: CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                currentDate: selectedDate,
                lastDate: currentYear.add(Duration(days: 365)),
                onDateChanged: (DateTime value) {
                  setState(() {
                    selectedDate = value;
                  });
                },
              ),
            ),
            InkWell(
              onTap: () async {
                final newTime = await showTimePicker(
                  context: context,
                  initialEntryMode: TimePickerEntryMode.dial,
                  initialTime: selectedTime ?? TimeOfDay.now(),
                );

                if (newTime == null) return;

                setState(() {
                  selectedTime = newTime;
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
                    child: Text(selectedTime?.format(context) ?? 'Sample text'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: contextSize(context).width * 0.035),
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
                      DateTime? finalDate;
                      if (selectedDate != null) {
                        finalDate = DateTime(
                          selectedDate!.year,
                          selectedDate!.month,
                          selectedDate!.day,
                          selectedTime?.hour ?? 0,
                          selectedTime?.minute ?? 0,
                        );
                      }
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
