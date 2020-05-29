import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './screens/summary_screen.dart';
import './screens/add_screen.dart';
import './models/activities.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Activities(),
          //use value for existing objects & lists
          //use create for new objectss
        ),
      ],
      child: CupertinoApp(
        theme: CupertinoThemeData(brightness: Brightness.light),
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final CupertinoTabController controller = CupertinoTabController();

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      controller: controller,
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
