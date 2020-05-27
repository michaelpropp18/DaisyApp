import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActivityRow extends StatelessWidget {
  final String text;
  final DateTime date;
  final bool isTop;

  ActivityRow({@required this.text, @required this.date, this.isTop = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 15),
          Container(
            alignment: Alignment.centerRight,
            width: 75,
            child: Text(
              DateFormat.jm().format(date),
              style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  width: 2,
                  color: isTop ? Colors.white : Colors.grey,
                ),
              ),
              ClipOval(
                child: Material(
                  color: Color.fromRGBO(53, 74, 95, 1),
                  child: SizedBox(width: 10, height: 10),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 2,
                  height: 2,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(width: 10),
          Text(text, style: TextStyle(color: Colors.black54, fontSize: 15)),
        ],
      ),
    );
  }
}
