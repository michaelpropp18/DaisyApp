import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'activity_model.dart';

class Activities with ChangeNotifier {
  List<ActivityModel> _items = [];

  List<ActivityModel> get items {
    return [..._items];
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
      final newActivity = ActivityModel(
          json.decode(response.body)['name'], type, entryTime);
      _items.insert(0, newActivity);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<void> fetchAndSetItems() async {
    const url = 'https://daisy-app-e36d5.firebaseio.com/activities.json';
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<ActivityModel> loadedItems = [];
    extractedData.forEach((id, value) {
      loadedItems.add(ActivityModel(
        id,
        value['type'],
        DateTime.parse(value['time']),
      ));
    });
    _items = loadedItems;
    notifyListeners();
  }
}
