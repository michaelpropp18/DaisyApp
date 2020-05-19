import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../widgets/activity_button.dart';

class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const IconData guidedog =
        IconData(0xe800, fontFamily: 'MyFlutterApp', fontPackage: null);
    const IconData fire_hydrant =
        IconData(0xe801, fontFamily: 'MyFlutterApp', fontPackage: null);
    const IconData poop =
        IconData(0xf619, fontFamily: 'MyFlutterApp', fontPackage: null);

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
                Text('Time: ' + DateFormat.jm().format(DateTime.now())),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (ctx) => CupertinoPopupSurface(
                              child: Container(
                                height: 200,
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
                                        initialDateTime: DateTime.now(),
                                        onDateTimeChanged: (newDateTime) {
                                          print('got here');
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ));
                  },
                  child: Icon(
                    CupertinoIcons.pen,
                    color: Color.fromRGBO(53, 74, 95, 1),
                    size: 20,
                  ),
                ),
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

          /*
          Container(
            height: 130,
            width: 350,
            child: CupertinoDatePicker(
              maximumDate: DateTime.now(),
              mode: CupertinoDatePickerMode.time,
              initialDateTime: DateTime.now(),
              onDateTimeChanged: (newDateTime) {
                print('yay');
              },
            ),
          ),
          */
          //MyPrefilledText(),
        ],
      ),
    );
  }
}

class MyPrefilledText extends StatefulWidget {
  @override
  _MyPrefilledTextState createState() => _MyPrefilledTextState();
}

class _MyPrefilledTextState extends State<MyPrefilledText> {
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: 'initial text');
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(controller: _textController);
  }
}
