// lib/core/widgets/error_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../theme/app_palette.dart';
import '../../presentation/providers/theme_provider.dart';

class ErrorView extends ConsumerWidget {
  final String message;
  final VoidCallback onRetry;

  const ErrorView({super.key, required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Pobieramy aktualny ThemeMode
    final themeMode = ref.watch(themeControllerProvider);

    // Wybieramy odpowiednie kolory w zależności od motywu
    final background = themeMode == ThemeMode.dark
        ? AppPalette.dark.surface
        : AppPalette.light.surface;
    final textColor = themeMode == ThemeMode.dark
        ? AppPalette.dark.onSurface
        : AppPalette.light.onSurface;
    final buttonColor = AppPalette.primary.main;
    final errorColor = AppPalette.semantic.error;

    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.error_outline, color: errorColor, size: 48.0),
              const SizedBox(height: 16.0),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: AppPalette.light.surface,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 12.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text("Retry"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
