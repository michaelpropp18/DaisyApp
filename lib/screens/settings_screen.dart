import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var selectedColor = Colors.red;
  var colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.lime,
    Colors.green,
    Colors.teal,
    Colors.cyan,
    Colors.indigo,
    Colors.purple,
    Colors.brown,
  ];

  @override
  Widget build(BuildContext context) {
    var children2 = <Widget>[
      Text('Michael'),
      Container(
        width: 18,
        height: 18,
        decoration: new BoxDecoration(
          color: Colors.blue,
          borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
        ),
      ),
    ];
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Color.fromRGBO(53, 74, 95, 1),
          middle: Text(
            'Settings',
            style: TextStyle(color: Colors.white),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text('Name:'),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: CupertinoTextField(
                    placeholder: 'User',
                  ),
                ),
                UserRow('Color', selectedColor),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      color: Colors.black12,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: colors
                            .map((c) => GestureDetector(
                                  onTap: () =>
                                      setState(() => selectedColor = c),
                                  child: ColorCircle(c),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 8.0),
                  child: Text('Other Members:'),
                ),
                UserRow('Michael', Colors.green),
                UserRow('Matthew', Colors.red),
                UserRow('Megan', Colors.orange),
                UserRow('Susan', Colors.blue),
              ],
            ),
          ),
        ));
  }
}

class UserRow extends StatelessWidget {
  final String name;
  final Color color;

  UserRow(this.name, this.color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: <Widget>[
          Text('$name: '),
          ColorCircle(color),
        ],
      ),
    );
  }
}

class ColorCircle extends StatelessWidget {
  final Color color;

  const ColorCircle(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: new BoxDecoration(
        color: color,
        borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
        border: new Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
    );
  }
}
