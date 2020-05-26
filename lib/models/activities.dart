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
      final newActivity =
          Activity(json.decode(response.body)['name'], type, entryTime);
      _items.insert(0, newActivity);
      sort();
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<void> removeItem(String id) async {
    _items.removeWhere((e) => e.id == id);
    notifyListeners();
    //const url = 'https://daisy-app-e36d5.firebaseio.com/activities.json';
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
        id,
        value['type'],
        DateTime.parse(value['time']),
      ));
    });
    _items = loadedItems;
    sort();
    notifyListeners();
  }
}
