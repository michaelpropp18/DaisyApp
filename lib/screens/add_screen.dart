import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ActivityButton(icon: guidedog, text: 'Walk'),
                ActivityButton(icon: fire_hydrant, text: 'Pee'),
                ActivityButton(icon: poop, text: 'Poop'),
                ActivityButton(icon: Icons.restaurant, text: 'Fed'),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 130,
            width: 350,
            child: CupertinoDatePicker(
              maximumDate: DateTime.now(),
              minuteInterval: 5,
              mode: CupertinoDatePickerMode.time,
              initialDateTime: DateTime.now(),
              onDateTimeChanged: (newDateTime) {
                print('yay');
              },
            ),
          ),
          
        ],
      ),
    );
  }
}

class ActivityButton extends StatefulWidget {
  final IconData icon;
  final String text;
  bool selected;
  ActivityButton(
      {@required this.icon, @required this.text, this.selected = false});

  @override
  _ActivityButtonState createState() => _ActivityButtonState();
}

class _ActivityButtonState extends State<ActivityButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.selected = !widget.selected;
        });
      },
      child: Column(
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            decoration: new BoxDecoration(
              color: widget.selected ? Colors.green : Colors.black12,
              borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
              border: new Border.all(
                color: widget.selected ? Colors.greenAccent : Colors.black26,
                width: 4.0,
              ),
            ),
            child: Icon(widget.icon, color: Color.fromRGBO(53, 74, 95, 1)),
          ),
          Text(widget.text),
        ],
      ),
    );
  }
}
