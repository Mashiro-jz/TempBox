// lib\presentation\pages\routing\account_routes.dart
import 'package:go_router/go_router.dart';
import '../account/auth_page.dart';
import '../account/login_page.dart';
import '../account/register_page.dart';
import 'app_router.dart';

class AccountRoutes {
  static List<GoRoute> routes = [
    GoRoute(
      path: RouteNames.auth,
      name: "auth",
      builder: (context, state) => const AuthPage(),
    ),
    GoRoute(
      path: RouteNames.login,
      name: "login",
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: RouteNames.register,
      name: "register",
      builder: (context, state) => const RegisterPage(),
    ),
  ];
}
