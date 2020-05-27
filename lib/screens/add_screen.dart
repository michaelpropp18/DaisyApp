import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../widgets/activity_button.dart';
import '../widgets/edit_time.dart';
import '../models/activities.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() {
    return _AddScreenState();
  }
}

class _AddScreenState extends State<AddScreen> {
  DateTime entryTime;
  Map<String, bool> selectedActivities = {
    'Pooped': false,
    'Peed': false,
    'Walk': false,
    'Fed': false,
  };

  bool itemSelected() {
    bool returnVal = false;
    selectedActivities.forEach((k, v) {
      if (v) {
        returnVal = true;
      }
    });
    return returnVal;
  }

  void updateNewTime(DateTime newTime) {
    setState(() => entryTime = newTime);
  }

  void updateSelectedActivities(String activityType) {
    setState(() =>
        selectedActivities[activityType] = !selectedActivities[activityType]);
  }

  void reset() {
    setState(() {
      selectedActivities = {
        'Pooped': false,
        'Peed': false,
        'Walk': false,
        'Fed': false,
      };
      entryTime = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    final activities = Provider.of<Activities>(context);
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
                        selected: selectedActivities['Walk'],
                        onPressed: () => updateSelectedActivities('Walk'),
                      ),
                      ActivityButton(
                        icon: Icons.restaurant,
                        text: 'Fed',
                        selected: selectedActivities['Fed'],
                        onPressed: () => updateSelectedActivities('Fed'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ActivityButton(
                        icon: fire_hydrant,
                        text: 'Pee',
                        selected: selectedActivities['Peed'],
                        onPressed: () => updateSelectedActivities('Peed'),
                      ),
                      ActivityButton(
                        icon: poop,
                        text: 'Poop',
                        selected: selectedActivities['Pooped'],
                        onPressed: () => updateSelectedActivities('Pooped'),
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
                if (itemSelected()) {
                  selectedActivities.forEach((k, v) {
                    if (v) {
                      activities.addItem(k, entryTime);
                    }
                  });
                }
                showCupertinoDialog(
                    context: context,
                    builder: (ctx) => CupertinoAlertDialog(
                          title: Text(itemSelected()
                              ? 'Activity Added'
                              : 'Please select an activity'),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              child: Text('Ok'),
                              onPressed: () {
                                Navigator.of(ctx).pop();
                                reset();
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
