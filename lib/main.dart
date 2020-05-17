import 'package:daisy_app/screens/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './screens/summary_screen.dart';
import './screens/add_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return CupertinoApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.collections),
            title: Text('Summary'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add_circled),
            title: Text('Add'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(builder: (_) {
              return SummaryScreen();
            });
            break;
          case 1:
            returnValue = CupertinoTabView(builder: (_) {
              return AddScreen();
            });
            break;
          case 2:
            returnValue = CupertinoTabView(builder: (_) {
              return SettingsScreen();
            });
            break;
          default:
            returnValue = CupertinoTabView(builder: (_) {
              return SummaryScreen();
            });
            break;
        }
        return returnValue;
      },
    );
  }
}
