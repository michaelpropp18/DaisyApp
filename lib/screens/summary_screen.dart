import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/activity_row.dart';
import '../widgets/date_divider.dart';
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
    activities.fetchAndSetItems();
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
                Dismissible(
                    key: ValueKey(activities.items[index].id),
                    direction: DismissDirection.endToStart,
                    child: ActivityRow(
                      text: activities.items[index].name == '' ? activities.items[index].type : '${activities.items[index].type} (${activities.items[index].name})',
                      date: activities.items[index].dateTime,
                      isTop: index == 0,
                    ),
                    onDismissed: (_) {
                      activities.removeItem(activities.items[index].id);
                    },
                    background: Container(
                      color: Colors.redAccent,
                      child: Icon(Icons.delete, color: Colors.white, size: 40),
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 20),
                    ),
                    confirmDismiss: (_) {
                      return showCupertinoDialog(
                          context: context,
                          builder: (ctx) => CupertinoAlertDialog(
                                title: Text('Delete Item'),
                                content: Text(
                                    'Are you sure you would like to delete this item?'),
                                actions: <Widget>[
                                  CupertinoDialogAction(
                                    child: Text('Yes'),
                                    onPressed: () {
                                      Navigator.of(ctx).pop(true);
                                    },
                                  ),
                                  CupertinoDialogAction(
                                    child: Text('No'),
                                    onPressed: () {
                                      Navigator.of(ctx).pop(false);
                                    },
                                  ),
                                ],
                              ));
                    }),
              ],
            );
          },
          itemCount: activities.items.length,
        ),
      ),
    );
  }
}
