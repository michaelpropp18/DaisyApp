import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
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
        child: Text('S'));
  }
}
