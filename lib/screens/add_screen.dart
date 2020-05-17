import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      const _kFontFam = 'MyFlutterApp';
      const _kFontPkg = null;

  const IconData guidedog = IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  const IconData fire_hydrant = IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  const IconData poop = IconData(0xf619, fontFamily: _kFontFam, fontPackage: _kFontPkg);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Color.fromRGBO(53, 74, 95, 1),
        middle: Text(
          'Daisy Tracker',
          style: TextStyle(color: Colors.white),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              print('fed');
            },
            child: Icon(Icons.restaurant),
          ),
          GestureDetector(
            onTap: () {
              print('walk');
            },
            //child: Icon(Icons.directions_walk),
            child: Icon(guidedog),
          ),
          GestureDetector(
            onTap: () {
              print('walk');
            },
            child: Icon(poop),
          ),
          GestureDetector(
            onTap: () {
              print('walk');
            },
            child: Icon(fire_hydrant),
          ),
        ],
      ),
    );
  }
}
