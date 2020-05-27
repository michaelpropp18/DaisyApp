import 'package:flutter/cupertino.dart';

class Activity {
  final String type;
  final DateTime dateTime;
  final String id;
  String userId;
  Color color;

  Activity(
      {@required this.id,
      @required this.type,
      @required this.dateTime,
      this.userId,
      this.color});
}
