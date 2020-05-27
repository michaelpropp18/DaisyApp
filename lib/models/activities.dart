import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'activity.dart';

class Activities with ChangeNotifier {
  static const maxItems = 100;

  List<Activity> _items = [];

  List<Activity> get items {
    return [..._items];
  }

  void sort() {
    _items.sort((a, b) => b.dateTime.compareTo(a.dateTime));
  }

  Future<void> addItem(String type, DateTime entryTime) async {
    const url = 'https://daisy-app-e36d5.firebaseio.com/activities.json';
    try {
      final response = await http.post(url,
          body: json.encode(
            {
              'time': entryTime.toString(),
              'type': type,
            },
          ));
      final newActivity = Activity(
        id: json.decode(response.body)['name'],
        type: type,
        dateTime: entryTime,
      );
      _items.insert(0, newActivity);
      sort();
      notifyListeners();
    } catch (error) {
      print('error in addItem of activities.dart');
      print(error);
    }
  }

  Future<void> removeItem(String id) async {
    final url = 'https://daisy-app-e36d5.firebaseio.com/activities/$id.json';
    final index = _items.indexWhere((a) => a.id == id);
    var removedItem = _items[index];
    _items.removeAt(index);
    notifyListeners();
    http.delete(url).then((response) {
      if (response.statusCode >= 400) {
        throw Exception();
      }
      removedItem = null;
    }).catchError((e) {
      print('error in removeItem of activities.dart');
      _items.insert(index, removedItem);
      notifyListeners();
    });
  }

  Future<void> fetchAndSetItems() async {
    const url = 'https://daisy-app-e36d5.firebaseio.com/activities.json';
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<Activity> loadedItems = [];
    if (extractedData == null) {
      return;
    }
    extractedData.forEach((id, value) {
      loadedItems.add(Activity(
        id: id,
        type: value['type'],
        dateTime: DateTime.parse(value['time']),
      ));
    });
    _items = loadedItems;
    sort();
    notifyListeners();
  }
}
