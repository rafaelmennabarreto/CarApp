import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker {
  static Future<DateTime> selectDate(BuildContext context) async {
    final DateTime _date = DateTime.now();

    return await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(1970),
        lastDate: DateTime(_date.year + 10));
  }
}

extension DateTimeExtension on DateTime {
  String formatedDate(String pattern) {
    DateFormat formatter = DateFormat(pattern);
    return formatter.format(this);
  }
}
