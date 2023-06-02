import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _prefs;
  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBoolToKey(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setStringToKey(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  bool getBoolFromKey(String key) {
    bool result = _prefs.getBool(key) ?? false;
    return result;
  }

  String getStringFromKey(String key) {
    String result = _prefs.getString(key) ?? '';
    return result;
  }

  Future<bool> removeFromKey(String key) {
    return _prefs.remove(key);
  }
}
