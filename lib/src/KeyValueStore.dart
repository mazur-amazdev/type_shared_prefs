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
        var object = _prefs?.getInt(key);
        return object is T ? object as T : null;
      case const (String):
        var object = _prefs?.getString(key);
        return object is T ? object as T : null;
      case const (bool):
        var object = _prefs?.getBool(key);
        return object is T ? object as T : null;
      case const (double):
        var object = _prefs?.getDouble(key);
        return object is T ? object as T : null;
      case const (List<String>):
        var object = _prefs?.getStringList(key);
        return object is T ? object as T : null;
      default:
        return null;
    }
  }

  void delete(String key) async {
    await _prefs?.remove(key);
  }
}
