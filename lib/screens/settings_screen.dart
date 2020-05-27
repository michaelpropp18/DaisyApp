import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/users.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController _controller;
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      Provider.of<Users>(context, listen: false)
          .fetchAndSetUsers()
          .catchError((error) {
        print(error);
      }).then((_) {
        _controller = new TextEditingController(
            text: Users.user != null ? Users.user.name : '');
      });
    });
    super.initState();
  }

  Color selectedColor = Users.user == null ? Color.fromRGBO(53, 74, 95, 1) : Users.user.color;
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
    final users = Provider.of<Users>(context);
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
                    onChanged: (newName) {
                      users.updateUserName(newName);
                    },
                    controller: _controller,
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
                                  onTap: () => setState(() {
                                    users.updateUserColor(c);
                                    selectedColor = Color(int.parse(
                                        'FF${c.value.toRadixString(16)}',
                                        radix: 16));
                                  }),
                                  child: ColorCircle(c),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 8.0),
                  child: Text('App Members:'),
                ),
                if (users.users != null)
                  Column(
                    children: users.users.map((user) {
                      return UserRow(user.name, user.color);
                    }).toList(),
                  ),
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
