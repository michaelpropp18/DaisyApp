import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './screens/summary_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        return CupertinoTabView(builder: (_) {
          return SummaryScreen();
        });
      },
    );
  }
}
