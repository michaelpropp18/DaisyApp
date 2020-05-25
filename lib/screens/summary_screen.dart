import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../widgets/activity.dart';
import '../widgets/date_divider.dart';
import '../models/activity_model.dart';
import '../models/activities.dart';

class SummaryScreen extends StatefulWidget {
  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      /*
      context isn't completed when initState is called. Using future Delayed allows
      this to be executed after the context is created.
      */
      Provider.of<Activities>(context, listen: false)
          .fetchAndSetItems()
          .catchError((error) {
        print(error);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final activities = Provider.of<Activities>(context);
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
            return Column(
              children: <Widget>[
                if (index == 0 ||
                    (index > 0 &&
                        activities.items[index].dateTime.day !=
                            activities.items[index - 1].dateTime.day))
                  DateDivider(activities.items[index].dateTime),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: Activity(
                    text: activities.items[index].type,
                    date: activities.items[index].dateTime,
                    isTop: index == 0,
                  ),
                ),
              ],
            );
          },
          itemCount: activities.items.length,
        ),
      ),
    );
  }
}
