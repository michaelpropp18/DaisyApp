import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(
        new LifecycleEventHandler(resumeCallBack: () async => reset()));
  }

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
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(height: 25,),
            Column(
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
                  SizedBox(height: 25,),
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
                SizedBox(height: 25,),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 25,
                ),
                EditTime(entryTime, updateNewTime),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Name: ', style: TextStyle(fontSize: 20)),
                    Container(
                        width: 100,
                        child: CupertinoTextField(controller: _textController)),
                  ],
                ),
              ],
            ),
            SizedBox(
                  height: 25,
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
                        activities.addItem(
                            k,
                            entryTime,
                            _textController.text == null
                                ? ''
                                : _textController.text);
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
          ],
        ),
      ),
    );
  }
}

class LifecycleEventHandler extends WidgetsBindingObserver {
  final AsyncCallback resumeCallBack;

  LifecycleEventHandler({this.resumeCallBack});

  @override
  Future<Null> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      await resumeCallBack();
    }
  }
}
