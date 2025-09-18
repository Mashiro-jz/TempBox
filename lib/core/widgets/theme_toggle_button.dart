// lib/core/widgets/theme_toggle_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:temp_box/core/theme/theme_repository.dart';
import '../../presentation/providers/theme_provider.dart';

class ThemeToggleButton extends ConsumerWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeControllerProvider);
    final themeController = ref.read(themeControllerProvider.notifier);
    final isDark = themeMode == ThemeMode.dark;

    return IconButton(
      tooltip: "Zmień motyw",
      icon: Icon(isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
      onPressed: () {
        themeController.setChoice(
          isDark ? ThemeChoice.light : ThemeChoice.dark,
        );
      },
    );
  }
}
