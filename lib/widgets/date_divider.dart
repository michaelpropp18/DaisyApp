import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateDivider extends StatelessWidget {
  final DateTime date;

  const DateDivider(this.date);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 25,
      width: double.infinity,
      child: Center(
        child: Text(DateFormat.yMMMMd('en_US').format(date),
            style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
