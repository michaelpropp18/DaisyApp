import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/activity.dart';

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
      child: Center(
        child: Column(
          children: [Activity(), Activity(), Activity(), Activity(), Activity(), Activity()],
        ),
      ),
    );
  }
}
