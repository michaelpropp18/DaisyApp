import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditTime extends StatelessWidget {
  final Function updateNewTime;
  final DateTime originalTime;

  const EditTime(this.originalTime, this.updateNewTime);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup(
          context: context,
          builder: (ctx) => CupertinoPopupSurface(
            child: Container(
              height: 250,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Enter a new time:'),
                  ),
                  Expanded(
                    child: CupertinoDatePicker(
                      maximumDate: DateTime.now(),
                      mode: CupertinoDatePickerMode.time,
                      initialDateTime: originalTime,
                      onDateTimeChanged: (newDateTime) {
                        updateNewTime(newDateTime);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Time: ' + DateFormat.jm().format(originalTime),
              style: TextStyle(fontSize: 20)),
          SizedBox(
            width: 10,
          ),
          Icon(
            CupertinoIcons.pen,
            color: Color.fromRGBO(53, 74, 95, 1),
            size: 20,
          ),
        ],
      ),
    );
  }
}
