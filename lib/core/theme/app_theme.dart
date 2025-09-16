// lib/core/theme/app_theme.dart
import 'app_palette.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppPalette.light.background,
    primaryColor: AppPalette.primary.main,
    cardColor: AppPalette.light.surface,
    dividerColor: AppPalette.light.outline,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFF1F2937)),
      bodyMedium: TextStyle(color: Color(0xFF6B7280)),
    ),
    colorScheme: ColorScheme.light(
      primary: AppPalette.primary.main,
      surface: AppPalette.light.surface,
      onSurface: AppPalette.light.onSurface,
      error: AppPalette.semantic.error,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppPalette.dark.background,
    primaryColor: AppPalette.primary.main,
    cardColor: AppPalette.dark.surface,
    dividerColor: AppPalette.dark.outline,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFFF9FAFB)),
      bodyMedium: TextStyle(color: Color(0xFF9CA3AF)),
    ),
    colorScheme: ColorScheme.dark(
      primary: AppPalette.primary.main,
      surface: AppPalette.dark.surface,
      onSurface: AppPalette.dark.onSurface,
      error: AppPalette.semantic.error,
    ),
  );
}
