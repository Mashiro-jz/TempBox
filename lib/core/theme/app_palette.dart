// lib/core/theme/app_palette.dart

import 'package:flutter/material.dart';

// Color definitions for the app.
class AppPalette {
  // Primary Accent
  static const primary = _PrimaryColors();

  // Neutral Colors (Background, Surface, Text)
  static const light = _LightColors();
  static const dark = _DarkColors();

  // Semantic Colors (Feedback)
  static const semantic = _SemanticColors();

  // Gradient
  static const gradient = _GradientColors();
}

// Primary accent colors
class _PrimaryColors {
  const _PrimaryColors();

  /// Primary Accent: Deep, electric lavender/lilac - modern, used in UIs
  final main = const Color(0xFF6366F1);
}

// Light theme colors
class _LightColors {
  const _LightColors();

  /// Light Background: Very light, almost white gray
  final background = const Color(0xFFF8FAFC);

  /// Light Surface: Pure white for cards/components
  final surface = const Color(0xFFFFFFFF);

  /// Primary text on light background (dark graphite, readable)
  final onBackground = const Color(0xFF1F2937);

  /// Primary text on light surface
  final onSurface = const Color(0xFF1F2937);

  /// Secondary text on light (medium gray)
  final onSurfaceVariant = const Color(0xFF6B7280);

  /// Border/Outline light (light gray)
  final outline = const Color(0xFFE5E7EB);
}

// Dark theme colors
class _DarkColors {
  const _DarkColors();

  /// Dark Background: Deep, rich black (not #000000)
  final background = const Color(0xFF030712);

  /// Dark Surface: Graphite, slightly lighter than background
  final surface = const Color(0xFF111827);

  /// Primary text on dark background (very light gray, almost white)
  final onBackground = const Color(0xFFF9FAFB);

  /// Primary text on dark surface
  final onSurface = const Color(0xFFF9FAFB);

  /// Secondary text on dark (light gray)
  final onSurfaceVariant = const Color(0xFF9CA3AF);

  /// Border/Outline dark (dark gray)
  final outline = const Color(0xFF374151);
}

// Semantic feedback colors
class _SemanticColors {
  const _SemanticColors();

  /// Error state
  final error = const Color(0xFFEF4444);

  /// Success state
  final success = const Color(0xFF10B981);
}

// Gradient colors (for headers, accents, etc.)
class _GradientColors {
  const _GradientColors();

  final LinearGradient primaryGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
  );
}
