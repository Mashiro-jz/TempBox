// lib\presentation\pages\routing\settings_routes.dart
import 'package:go_router/go_router.dart';
import '../settings/settings_page.dart';
import 'app_router.dart';

class SettingsRoutes {
  static List<GoRoute> routes = [
    GoRoute(
      path: RouteNames.settings,
      name: "settings",
      builder: (context, state) => const SettingsPage(),
    ),
  ];
}
