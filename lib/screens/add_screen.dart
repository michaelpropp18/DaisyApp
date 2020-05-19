import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../widgets/activity_button.dart';
import '../widgets/edit_time.dart';
import '../models/activity_model.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  DateTime entryTime;
  Map<ActivityType, bool> selectedActivities = {
    ActivityType.Pooped: false,
    ActivityType.Peed: false,
    ActivityType.Walk: false,
    ActivityType.Fed: false,
  };

  void updateNewTime(DateTime newTime) {
    setState(() => entryTime = newTime);
  }

  void updateSelectedActivities(ActivityType activityType) {
    setState(() =>
        selectedActivities[activityType] = !selectedActivities[activityType]);
  }

  void addEntry() {
    setState(() {
      selectedActivities = {
        ActivityType.Pooped: false,
        ActivityType.Peed: false,
        ActivityType.Walk: false,
        ActivityType.Fed: false,
      };
      entryTime = DateTime.now();
    });
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
          'Add Entry',
          style: TextStyle(color: Colors.white),
        ),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ActivityButton(
                        icon: guidedog,
                        text: 'Walk',
                        selected: selectedActivities[ActivityType.Walk],
                        onPressed: () =>
                            updateSelectedActivities(ActivityType.Walk),
                      ),
                      ActivityButton(
                        icon: Icons.restaurant,
                        text: 'Fed',
                        selected: selectedActivities[ActivityType.Fed],
                        onPressed: () =>
                            updateSelectedActivities(ActivityType.Fed),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ActivityButton(
                        icon: fire_hydrant,
                        text: 'Pee',
                        selected: selectedActivities[ActivityType.Peed],
                        onPressed: () =>
                            updateSelectedActivities(ActivityType.Peed),
                      ),
                      ActivityButton(
                        icon: poop,
                        text: 'Poop',
                        selected: selectedActivities[ActivityType.Pooped],
                        onPressed: () =>
                            updateSelectedActivities(ActivityType.Pooped),
                      ),
                    ],
                  ),
                ]),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Time: ' + DateFormat.jm().format(entryTime),
                    style: TextStyle(fontSize: 20)),
                SizedBox(
                  width: 10,
                ),
                EditTime(entryTime, updateNewTime),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: CupertinoButton(
              color: Color.fromRGBO(53, 74, 95, 1),
              disabledColor: Colors.grey,
              child: Text('Add Entry'),
              onPressed: () {
                addEntry();
                showCupertinoDialog(
                    context: context,
                    builder: (ctx) => CupertinoAlertDialog(
                          title: Text('Activity Added'),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              child: Text('Ok'),
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                            ),
                          ],
                        ));
              },
            ),
          ),
          SizedBox(height: kBottomNavigationBarHeight),
        ],
      ),
    );
  }
}
