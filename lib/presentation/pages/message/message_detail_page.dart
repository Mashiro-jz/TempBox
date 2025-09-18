// lib/presentation/pages/message_detail_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:temp_box/core/widgets/loading_indicator.dart';
import 'package:temp_box/domain/entities/message_entity.dart';
import 'package:temp_box/presentation/providers/message_repository_provider.dart';

class MessageDetailPage extends ConsumerWidget {
  final String messageId;

  const MessageDetailPage({super.key, required this.messageId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageRepo = ref.watch(messageRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Wiadomość"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            tooltip: "Usuń wiadomość",
            onPressed: () async {
              final success = await messageRepo.deleteMessage(messageId);
              if (success) {
                context.go("/mailbox");
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Nie udało się usunąć wiadomości"),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: FutureBuilder<MessageEntity>(
        future: messageRepo.messageFrom(messageId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: LoadingIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Błąd podczas wczytywania wiadomości: ${snapshot.error}",
              ),
            );
          }

          final message = snapshot.data!;
          final fromName = message.from.values.isNotEmpty
              ? message.from.values.first
              : "Nieznany nadawca";

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.subject.isNotEmpty
                      ? message.subject
                      : "(Brak tematu)",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Od: $fromName",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Divider(height: 24),
                Text(
                  message.text.isNotEmpty ? message.text : "(Brak treści)",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
