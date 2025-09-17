import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MessageDetailPage extends StatelessWidget {
  final int placeId;
  const MessageDetailPage({super.key, required this.placeId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Message Detail")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Message ID: $placeId"),
            ElevatedButton(
              onPressed: () => context.go("/mailbox"),
              child: const Text("Back to Mailbox"),
            ),
          ],
        ),
      ),
    );
  }
}
