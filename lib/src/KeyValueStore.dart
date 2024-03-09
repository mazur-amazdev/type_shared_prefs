import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class KeyValueStore {
  KeyValueStore() {
    setup();
  }

  // MARK: Properties

  SharedPreferences? _prefs;

  // MARK: - functions

  void setup() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// writes the dynamic value in the shared prefs to the given key
  void write(String key, dynamic value) async {
    switch (value.runtimeType) {
      case const (int):
        await _prefs?.setInt(key, value);
      case const (String):
        await _prefs?.setString(key, value);
      case const (bool):
        await _prefs?.setBool(key, value);
      case const (double):
        await _prefs?.setDouble(key, value);
      case const (List<String>):
        await _prefs?.setStringList(key, value);
      default:
        debugPrint(
            "Couldn't persist the value its type is: ${value.runtimeType}");
    }
  }

  /// retrieves the wanted type for key returns null if the type are mismatching
  T? getValue<T>(String key) {
    switch (T) {
      case const (int):
        return _prefs?.getInt(key) as T;
      case const (String):
        return _prefs?.getString(key) as T;
      case const (bool):
        return _prefs?.getBool(key) as T;
      case const (double):
        return _prefs?.getDouble(key) as T;
      case const (List<String>):
        return _prefs?.getStringList(key) as T;
      default:
        return null;
    }
  }

  void delete(String key) async {
    await _prefs?.remove(key);
  }
}
