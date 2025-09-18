// lib/core/widgets/error_card.dart
import 'package:flutter/material.dart';
import '../theme/app_palette.dart';
import '../../presentation/providers/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorCard extends ConsumerWidget {
  final String message;
  final VoidCallback onRetry;

  const ErrorCard({super.key, required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeControllerProvider);

    final background = themeMode == ThemeMode.dark
        ? AppPalette.dark.surface
        : AppPalette.light.surface;
    final textColor = themeMode == ThemeMode.dark
        ? AppPalette.dark.onSurface
        : AppPalette.light.onSurface;
    final buttonColor = AppPalette.primary.main;

    return Center(
      child: Card(
        color: background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(horizontal: 32),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                color: AppPalette.semantic.error,
                size: 40,
              ),
              const SizedBox(height: 12),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(color: textColor, fontSize: 16),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: AppPalette.light.surface,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Spróbuj ponownie"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
