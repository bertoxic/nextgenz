import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  // Future<UserModel> readAsModel(String key) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   String? getString = prefs.getString(key);

  //   return UserModel.fromJson(json.decode('$getString'));
  // }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String? getString = prefs.getString(key);
    return getString;
  }

  Future<bool?> readPendingStatus(String key) async {
    final prefs = await SharedPreferences.getInstance();
    bool? getBool = prefs.getBool(key);

    return getBool;
  }

  saveCount(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  Future<int?> readInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    int? getInt = prefs.getInt(key);
    return getInt;
  }
}
