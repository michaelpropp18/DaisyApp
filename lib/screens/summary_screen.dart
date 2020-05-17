import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/activity.dart';
import '../widgets/date_divider.dart';
import '../models/activity_model.dart';

class SummaryScreen extends StatelessWidget {
  final List<ActivityModel> activities = [
    ActivityModel(ActivityType.Fed, DateTime.now()),
    ActivityModel(ActivityType.Pooped, DateTime.now()),
    ActivityModel(ActivityType.Peed, DateTime.now()),
    ActivityModel(ActivityType.Fed, DateTime.now()),
  ];
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
            return Container(
              height: 50,
              width: double.infinity,
              child: Activity(
                text: activities[index].text,
                date: activities[index].date,
                isTop: index == 0,
              ),
            );
          },
          itemCount: activities.length,
        ),
      ),
    );
  }
}
