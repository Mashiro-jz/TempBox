import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../routing/app_router.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Register Page"),
            ElevatedButton(
              onPressed: () => context.go(RouteNames.mailBox),
              child: const Text("Register (Go to Mailbox)"),
            ),
          ],
        ),
      ),
    );
  }
}
