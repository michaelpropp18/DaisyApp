import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('title here'),
      ),
      child: Center(
        child: Text('hello world'),
      ),
    );
  }
}
