import 'package:flutter/material.dart';

class Activity extends StatelessWidget {
  final String text;
  final String time;
  bool isTop;

  Activity({@required this.text, @required this.time, this.isTop = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 15),
        Container(
          alignment: Alignment.centerRight,
          width: 50,
          child:
              Text(time, style: TextStyle(color: Colors.black54, fontSize: 15)),
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
    );
  }
}
