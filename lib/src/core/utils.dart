import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String parseDateDMY(DateTime date) {
  final DateFormat formatter = DateFormat('EEE, MMM d, ' 'yyyy');
  return formatter.format(date);
}

Size contextSize(BuildContext context) => MediaQuery.of(context).size;
