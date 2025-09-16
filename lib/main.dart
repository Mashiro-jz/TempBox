// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import './core/theme/app_theme.dart';
import './presentation/providers/theme_provider.dart';
// import './presentation/routing/app_router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Pobieramy aktualny ThemeMode z ThemeController (tutaj mamy wywołanie także instancji SharedPreferences)
    final themeMode = ref.watch(themeControllerProvider);

    return MaterialApp.router(
      title: 'TempBox',

      // Motywy
      theme: ref.watch(lightThemeProvider),
      darkTheme: ref.watch(darkThemeProvider),
      themeMode: themeMode,

      // Nawigacja
      // routerConfig: ref.watch(appRouterProvider),
    );
  }
}
