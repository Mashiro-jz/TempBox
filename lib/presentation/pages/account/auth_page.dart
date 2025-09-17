import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../routing/app_router.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Auth Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome! You are on Auth Page"),
            ElevatedButton(
              onPressed: () => context.go(RouteNames.login),
              child: const Text("Go to Login"),
            ),
            ElevatedButton(
              onPressed: () => context.go(RouteNames.register),
              child: const Text("Go to Register"),
            ),
          ],
        ),
      ),
    );
  }
}
