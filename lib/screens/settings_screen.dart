import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool pushNotifications = false;
  bool textNotifications = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Color.fromRGBO(53, 74, 95, 1),
          middle: Text(
            'Settings',
            style: TextStyle(color: Colors.white),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('PROFILE'),
            Text('Name'),
            CupertinoTextField(
              placeholder: "Michael",
            ),
            Text('Phone Number'),
            CupertinoTextField(
              placeholder: "404-858-2246",
            ),
            Row(
              children: <Widget>[
                Text('Color'),
                Container(
                  width: 18,
                  height: 18,
                  decoration: new BoxDecoration(
                    color: Colors.green,
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(50.0)),
                  ),
                ),
              ],
            ),
            Text(''),
            Text('NOTIFICATIONS'),
            Row(
              children: <Widget>[
                Text('Push: '),
                Container(
                  child: CupertinoSwitch(
                    onChanged: (bool value) {
                      setState(() => pushNotifications = value);
                    },
                    value: pushNotifications,
                  ),
                )
              ],
            ),
             Row(
              children: <Widget>[
                Text('Text sms: '),
                Container(
                  child: CupertinoSwitch(
                    onChanged: (bool value) {
                      setState(() => textNotifications = value);
                    },
                    value: textNotifications,
                  ),
                )
              ],
            ),
            Text(''),
            Text('OTHER MEMBERS:'),
            Row(
              children: <Widget>[
                Text('Michael'),
                Container(
                  width: 18,
                  height: 18,
                  decoration: new BoxDecoration(
                    color: Colors.blue,
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(50.0)),
                  ),
                ),
              ],
            ),
            Text('Megan'),
            Text('Matthew'),
            Text('Susan'),
          ],
        ));
  }
}
