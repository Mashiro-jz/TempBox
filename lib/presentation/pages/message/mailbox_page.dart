import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../routing/app_router.dart';

class MailBoxPage extends StatelessWidget {
  const MailBoxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mailbox")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Mailbox Page"),
            ElevatedButton(
              onPressed: () => context.go("${RouteNames.messageDetail}/1"),
              child: const Text("Go to Message 1"),
            ),
            ElevatedButton(
              onPressed: () => context.go(RouteNames.settings),
              child: const Text("Go to Settings"),
            ),
          ],
        ),
      ),
    );
  }
}
