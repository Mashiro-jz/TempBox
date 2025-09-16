// lib/features/theme/theme_repository.dart

import 'package:shared_preferences/shared_preferences.dart';

enum ThemeChoice { system, light, dark }

class ThemeRepository {
  static const _themeKey = 'theme_choice';

  /// Wczytuje zapisany wybór motywu z SharedPreferences
  Future<ThemeChoice> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_themeKey);
    switch (saved) {
      case 'light':
        return ThemeChoice.light;
      case 'dark':
        return ThemeChoice.dark;
      default:
        return ThemeChoice.system;
    }
  }

  /// Zapisuje wybór motywu do SharedPreferences
  Future<void> saveTheme(ThemeChoice choice) async {
    final prefs = await SharedPreferences.getInstance();
    switch (choice) {
      case ThemeChoice.light:
        await prefs.setString(_themeKey, 'light');
        break;
      case ThemeChoice.dark:
        await prefs.setString(_themeKey, 'dark');
        break;
      case ThemeChoice.system:
        await prefs.remove(_themeKey);
        break;
    }
  }
}
