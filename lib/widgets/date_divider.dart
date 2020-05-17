import 'package:flutter/material.dart';

class DateDivider extends StatelessWidget {
  final String date;

  const DateDivider(this.date);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 25,
      width: double.infinity,
      child: Center(
        child: Text(date, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
