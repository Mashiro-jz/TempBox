// lib/core/storage/key_value_storage.dart
import 'package:shared_preferences/shared_preferences.dart';

/// Abstrakcja nad przechowywaniem par klucz-wartość.
/// Dzięki temu możemy łatwo podmienić SharedPreferences np. na Hive czy SecureStorage.
abstract class KeyValueStorage {
  Future<void> write(String key, String value);
  Future<String?> read(String key);
  Future<void> delete(String key);
  Future<bool> containsKey(String key);
}

/// Implementacja oparta o SharedPreferences.
class SharedPrefsStorage implements KeyValueStorage {
  @override
  Future<void> write(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  @override
  Future<String?> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  @override
  Future<void> delete(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  @override
  Future<bool> containsKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }
}
