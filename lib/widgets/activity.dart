import 'package:flutter/material.dart';

enum ActivityType {
  Pee,
  Poop,
  Walk,
  Food,
  DentalChew,
}

class Activity extends StatelessWidget {
  final String text = 'Fed';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        SizedBox(width: 10, height: 10),
        Text('9:32'),
        SizedBox(width: 10, height: 10),
        Column(
          children: <Widget>[
            Container(
              width: 2,
              height: 10,
              color: Colors.grey,
            ),
            ClipOval(
              child: Material(
                color: Color.fromRGBO(53, 74, 95, 1),
                child: SizedBox(width: 20, height: 20),
              ),
            ),
            Container(
              width: 2,
              height: 10,
              color: Colors.grey,
            ),
          ],
        ),
        SizedBox(width: 10, height: 10),
        Text(text, style: TextStyle(fontSize: 30)),
      ]),
    );
  }
}
