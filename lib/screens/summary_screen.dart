import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/activity.dart';
import '../widgets/date_divider.dart';

class SummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Color.fromRGBO(53, 74, 95, 1),
        middle: Text(
          'Daisy Tracker',
          style: TextStyle(color: Colors.white),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(5),
        child: ListView.builder(
          itemBuilder: (context, index) {
            if (index % 10 == 0) {
              return DateDivider('01/01/2020');
            } else if (index == 29) {
              return Center(
                child: Text('Load more'),
              );
            } else if (index % 3 == 0) {
              return Container(
                height: 50,
                width: double.infinity,
                child: Activity(
                  text: 'Pooped',
                  time: '18:08',
                  isTop: index == 1,
                ),
              );
            } else {
              return Container(
                height: 50,
                width: double.infinity,
                child: Activity(
                  text: 'Peed',
                  time: '9:08',
                  isTop: index == 1,
                ),
              );
            }
          },
          itemCount: 30,
        ),
      ),
    );
  }
}
