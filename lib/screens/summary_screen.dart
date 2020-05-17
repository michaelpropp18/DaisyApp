import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/activity.dart';
import '../widgets/date_divider.dart';
import '../models/activity_model.dart';

class SummaryScreen extends StatelessWidget {
  final List<ActivityModel> activities = [
    ActivityModel(ActivityType.Walk,
        DateTime.now()),
    ActivityModel(ActivityType.Peed,
        DateTime.now().subtract(Duration(minutes: 50))),
    ActivityModel(ActivityType.Peed,
        DateTime.now().subtract(Duration(hours: 17))),
    ActivityModel(ActivityType.Pooped,
        DateTime.now().subtract(Duration(hours: 20))),
    ActivityModel(ActivityType.Peed,
        DateTime.now().subtract(Duration(days: 1))),
    ActivityModel(ActivityType.Walk,
        DateTime.now().subtract(Duration(days: 1, minutes: 16))),
    ActivityModel(ActivityType.Fed,
        DateTime.now().subtract(Duration(days: 1, minutes: 89))),
  ];

  Widget ActivityContainer(int index) {
    return Container(
      height: 50,
      width: double.infinity,
      child: Activity(
        text: activities[index].text,
        date: activities[index].date,
        isTop: index == 0,
      ),
    );
  }

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
            if (index == 0) {
              return Column(
                children: <Widget>[
                  DateDivider(activities[index].date),
                  ActivityContainer(index),
                ],
              );
            } else if (index > 0 &&
                activities[index].date.day != activities[index - 1].date.day) {
              return Column(
                children: <Widget>[
                  DateDivider(activities[index].date),
                  ActivityContainer(index),
                ],
              );
            } else {
              return ActivityContainer(index);
            }
          },
          itemCount: activities.length,
        ),
      ),
    );
  }
}
