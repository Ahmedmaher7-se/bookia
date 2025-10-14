import 'dart:convert';

import 'package:bookia/feature/auth/data/models/auth_response/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences pref;

  static const String kUserData = 'userData';

  static init() async {
    pref = await SharedPreferences.getInstance();
  }

  static saveUserData(UserModel? model) {
    if (model == null) return;
    // object to json
    var json = model.toJson();
    // map to string
    var jsonToString = jsonEncode(json);

    saveData(kUserData, jsonToString);
  }

  static UserModel? getUserData() {
    String? stringData = getData(kUserData);

    if (stringData == null) return null;

    var stringToJson = jsonDecode(stringData);

    return UserModel.fromJson(stringToJson);
  }

  static saveData(String key, dynamic value) {
    if (value is int) {
      pref.setInt(key, value);
    } else if (value is String) {
      pref.setString(key, value);
    } else if (value is bool) {
      pref.setBool(key, value);
    } else if (value is double) {
      pref.setDouble(key, value);
    } else if (value is List<String>) {
      pref.setStringList(key, value);
    }
  }

  static dynamic getData(String key) {
    return pref.get(key);
  }

  static remove(String key) async {
    await pref.remove(key);
  }
}
