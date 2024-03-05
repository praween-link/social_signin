import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static late SharedPreferences _sharedPreferences;
  static init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static saveMapData(String key, Map<String, dynamic> data) {
    _sharedPreferences.setString(key, jsonEncode(data));
  }

  static Map<String, dynamic>? getMapData(String key) {
    var data = _sharedPreferences.getString(key);
    if (data == null) return null;
    return jsonDecode(data);
  }

  static removeMapData(String key) {
    _sharedPreferences.remove(key);
  }
}
