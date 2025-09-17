// lib\presentation\pages\routing\app_router.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widgets/error_view.dart';
import 'account_routes.dart';
import 'message_routes.dart';
import 'settings_routes.dart';
import '../../providers/auth_provider.dart';

class GoRouterNotifier extends ChangeNotifier {
  GoRouterNotifier(this.ref) {
    _sub = ref.listen<AuthState>(authProvider, (_, _) => notifyListeners());
  }

  final Ref ref;
  late final ProviderSubscription<AuthState> _sub;

  @override
  void dispose() {
    _sub.close();
    super.dispose();
  }
}

class RouteNames {
  static const auth = "/auth";
  static const login = "/login";
  static const register = "/register";
  static const mailBox = "/mailbox";
  static const messageDetail = "/messageDetails";
  static const settings = "/settings";
}

final goRouterProvider = Provider<GoRouter>((ref) {
  final notifier = GoRouterNotifier(ref);

  return GoRouter(
    initialLocation: RouteNames.auth,
    refreshListenable: notifier,
    redirect: (context, state) {
      final authState = ref.read(authProvider);
      final isAuthenticated = authState.user != null;

      const authPaths = [
        RouteNames.auth,
        RouteNames.login,
        RouteNames.register,
      ];

      final isAuthPath = authPaths.contains(state.matchedLocation);

      if (isAuthenticated && isAuthPath) return RouteNames.mailBox;
      if (!isAuthenticated && !isAuthPath) return RouteNames.auth;

      return null;
    },
    routes: [
      ...AccountRoutes.routes,
      ...MessageRoutes.routes,
      ...SettingsRoutes.routes,
    ],
    errorBuilder: (context, state) => Scaffold(
      body: ErrorView(
        message: state.error.toString(),
        onRetry: () => GoRouter.of(context).go(RouteNames.auth),
      ),
    ),
  );
});
