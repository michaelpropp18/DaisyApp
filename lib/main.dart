import 'package:provider/provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './screens/summary_screen.dart';
import './screens/add_screen.dart';
import './screens/settings_screen.dart';
import './models/activities.dart';
import './models/users.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SharedPreferences.setMockInitialValues({});
  runApp(MyApp());
}
/*
String test;

Future<int> getUserKeyFromSharedPref() async {
  final prefs = await SharedPreferences.getInstance();
  final number = prefs.getInt('startupNumber');
  if (number == null) {
    return 0;
  } else {
    return 1;
  }
}
*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Activities(),
          //use value for existing objects & lists
          //use create for new objectss
        ),
        ChangeNotifierProvider(
          create: (ctx) => Users(),
          //use value for existing objects & lists
          //use create for new objects
        ),
        ChangeNotifierProvider(
          create: (ctx) => Users(),
          //use value for existing objects & lists
          //use create for new objects
        ),
      ],
      child: CupertinoApp(
        home: HomeScreen(),
      ),
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
