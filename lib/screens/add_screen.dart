import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../widgets/activity_button.dart';
import '../widgets/edit_time.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  DateTime entryTime;

  void updateNewTime(DateTime newTime) {
    print(newTime);
    setState(() => entryTime = newTime);
  }

  @override
  Widget build(BuildContext context) {
    const IconData guidedog =
        IconData(0xe800, fontFamily: 'MyFlutterApp', fontPackage: null);
    const IconData fire_hydrant =
        IconData(0xe801, fontFamily: 'MyFlutterApp', fontPackage: null);
    const IconData poop =
        IconData(0xf619, fontFamily: 'MyFlutterApp', fontPackage: null);
    if (entryTime == null) {
      entryTime = DateTime.now();
    }

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Color.fromRGBO(53, 74, 95, 1),
        middle: Text(
          'Daisy Tracker',
          style: TextStyle(color: Colors.white),
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ActivityButton(icon: guidedog, text: 'Walk'),
              ActivityButton(icon: Icons.restaurant, text: 'Fed'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ActivityButton(icon: fire_hydrant, text: 'Pee'),
              ActivityButton(icon: poop, text: 'Poop'),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Time: ' + DateFormat.jm().format(entryTime)),
                SizedBox(
                  width: 10,
                ),
                EditTime(entryTime, updateNewTime),
              ],
            ),
          ),
          CupertinoButton(
            color: Color.fromRGBO(53, 74, 95, 1),
            disabledColor: Colors.grey,
            child: Text('Add Entry'),
            onPressed: () {
              print('got here');
            },
          ),
          SizedBox(height: kBottomNavigationBarHeight),
        ],
      ),
    );
  }
}
