// lib/features/theme/theme_provider.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../../core/theme/app_theme.dart';
import '../../core/theme/theme_repository.dart';

// Provider repozytorium
final themeRepositoryProvider = Provider<ThemeRepository>((ref) {
  return ThemeRepository();
});

// Provider dla ThemeController (StateNotifier)
final themeControllerProvider =
    StateNotifierProvider<ThemeController, ThemeMode>((ref) {
      final repo = ref.read(themeRepositoryProvider);
      return ThemeController(repo);
    });

// Providers dla gotowych ThemeData
final lightThemeProvider = Provider<ThemeData>((ref) => AppTheme.lightTheme);
final darkThemeProvider = Provider<ThemeData>((ref) => AppTheme.darkTheme);

// Kontroler motywu
class ThemeController extends StateNotifier<ThemeMode> {
  final ThemeRepository _repo;

  ThemeController(this._repo) : super(ThemeMode.system) {
    _init(); // wczytaj zapisany wybór przy starcie
  }

  Future<void> _init() async {
    final choice = await _repo.loadTheme();
    state = _mapChoice(choice);
  }

  ThemeMode _mapChoice(ThemeChoice choice) {
    switch (choice) {
      case ThemeChoice.light:
        return ThemeMode.light;
      case ThemeChoice.dark:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  /// Zmiana motywu i zapis do SharedPreferences
  Future<void> setChoice(ThemeChoice choice) async {
    await _repo.saveTheme(choice);
    state = _mapChoice(choice);
  }
}
