// lib/core/widgets/loading_indicator.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../theme/app_palette.dart';
import '../../presentation/providers/theme_provider.dart';

class LoadingIndicator extends ConsumerWidget {
  final double size;

  const LoadingIndicator({super.key, this.size = 48.0});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Pobieramy aktualny ThemeMode
    final themeMode = ref.watch(themeControllerProvider);

    // Wybieramy kolor w zależności od motywu
    final indicatorColor = themeMode == ThemeMode.dark
        ? AppPalette.primary.main
        : AppPalette.primary.main;

    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: 4.0,
          valueColor: AlwaysStoppedAnimation<Color>(indicatorColor),
        ),
      ),
    );
  }
}
