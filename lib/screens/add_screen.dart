import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../widgets/activity_button.dart';

class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const _kFontFam = 'MyFlutterApp';
    const _kFontPkg = null;

    const IconData guidedog =
        IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
    const IconData fire_hydrant =
        IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
    const IconData poop =
        IconData(0xf619, fontFamily: _kFontFam, fontPackage: _kFontPkg);

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
          Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 30,
              mainAxisSpacing: 0,
              crossAxisCount: 2,
              children: <Widget>[
                ActivityButton(icon: guidedog, text: 'Walk'),
                ActivityButton(icon: Icons.restaurant, text: 'Fed'),
                ActivityButton(icon: fire_hydrant, text: 'Pee'),
                ActivityButton(icon: poop, text: 'Poop'),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Time: ' + DateFormat.jm().format(DateTime.now())),
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
          SizedBox(
            height: 30,
          ),
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
          MyPrefilledText(),
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
