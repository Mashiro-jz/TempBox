// lib/presentation/routing/app_router.dart

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:temp_box/core/widgets/error_view.dart';
import '../../core/widgets/error_view.dart';
import '../pages/auth_page.dart';
import '../pages/login_page.dart';
import '../pages/register_page.dart';
import '../pages/message_detail_page.dart';
import '../pages/mailbox_page.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (dynamic _) => notifyListeners(),
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    unawaited(_subscription.cancel());
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
  final authRepo = ref.read(authRepositoryProvider);

  return GoRouter(
    initialLocation: RouteNames.auth,
    refreshListenable: GoRouterRefreshStream(authRepo.authStateChanges),
    redirect: (context, state) async {
      try {
        final isAuthenticated = await authRepo.isLoggedIn;
        final authPaths = [
          RouteNames.auth,
          RouteNames.login,
          RouteNames.register,
        ];

        final isAuthPath = authPaths.contains(state.matchedLocation);

        if (isAuthenticated && isAuthPath) {
          return RouteNames.mailBox;
        }

        if (!isAuthenticated && !isAuthPath) {
          return RouteNames.auth;
        }

        return null;
      } catch (e, stackTrace) {
        debugPrint("Router redirect error: $e\n$stackTrace");
        return RouteNames.auth;
      }
    },
    routes: [
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
      GoRoute(
        path: RouteNames.mailBox,
        name: "home",
        builder: (context, state) => const MailBoxPage(),
      ),
      GoRoute(
        path: "${RouteNames.messageDetail}/:id",
        name: "details",
        builder: (context, state) {
          final id = int.parse(state.pathParameters["id"]!);
          return MessageDetailPage(placeId: id);
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: ErrorView(
        message: state.error.toString(),
        onRetry: () => GoRouter.of(context).go(RouteNames.auth),
      ),
    ),
  );
});
