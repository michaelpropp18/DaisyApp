enum ActivityType {
  Pooped,
  Peed,
  Fed,
  Walk,
}

class ActivityModel {
  final ActivityType _type;
  final DateTime _date;

  ActivityModel(this._type, this._date);

  DateTime get date {
    return _date;
  }

  String get text {
    switch (_type) {
      case ActivityType.Pooped:
        {
          return 'Pooped';
        }
        break;
      case ActivityType.Peed:
        {
          return 'Peed';
        }
        break;
      case ActivityType.Fed:
        {
          return 'Fed';
        }
        break;
      case ActivityType.Walk:
        {
          return 'Walk';
        }
        break;
      default:
        {
          return 'Other';
        }
        break;
    }
  }
}
