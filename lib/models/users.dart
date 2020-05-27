import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'user.dart';

class Users with ChangeNotifier {
  static String userKey;

  static Future<void> getUserKey() async {
    final prefs = await SharedPreferences.getInstance();
    userKey = prefs.getString('userKey');
    if (userKey == null) { // new user
      addUser('Anonymous', Color.fromRGBO(53, 74, 95, 1));
    } 
    await prefs.setString('userKey', userKey);
  }

  static Future<void> addUser(String name, Color color) async {
    const url = 'https://daisy-app-e36d5.firebaseio.com/users.json';
    try {
      final response = await http.post(url,
          body: json.encode(
            {
              'name': name,
              'color': color.value.toRadixString(16),
            },
          ));
      userKey = json.decode(response.body)['name'];
    } catch (error) {
      print(error);
    }
  }

  Future<void> fetchAndSetUsers() async {
    const url = 'https://daisy-app-e36d5.firebaseio.com/users.json';
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<User> loadedUsers = [];
    if (extractedData == null) {
      return;
    }
    extractedData.forEach((id, value) {
      loadedUsers.add(User(
        id: id,
        name: value['name'],
        color: _colorFromHex(value['color']),
      ));
    });
    _users = loadedUsers;
    notifyListeners();
  }

  Color _colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  List<User> _users = [];

  List<User> get users {
    return [..._users];
  }
}
