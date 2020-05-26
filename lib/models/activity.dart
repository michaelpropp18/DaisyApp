class Activity {
  final String _type;
  final DateTime _dateTime;
  final String _id;

  Activity(this._id, this._type, this._dateTime);

  DateTime get dateTime {
    return _dateTime;
  }

  String get type {
    return _type;
  }

  String get id {
    return _id;
  }
}
