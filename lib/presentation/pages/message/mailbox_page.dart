// lib/presentation/pages/mailbox_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:temp_box/core/widgets/error_card.dart';
import 'package:temp_box/core/widgets/loading_indicator.dart';
import 'package:temp_box/domain/entities/message_entity.dart';
import 'package:temp_box/presentation/providers/message_repository_provider.dart';

class MailboxPage extends ConsumerWidget {
  const MailboxPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageRepo = ref.watch(messageRepositoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Mailbox")),
      body: StreamBuilder<List<MessageEntity>>(
        stream: messageRepo.allMessages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: LoadingIndicator());
          }

          if (snapshot.hasError) {
            return ErrorCard(
              message: "Nie udało się pobrać wiadomości: ${snapshot.error}",
              onRetry: () {
                final _ = ref.refresh(
                  messageRepositoryProvider,
                ); // dodałem tutaj _, aby IDE przestało dawać błąd <3
              },
            );
          }

          final messages = snapshot.data;

          if (messages == null || messages.isEmpty) {
            return const Center(child: Text("Brak wiadomości"));
          }

          return ListView.separated(
            itemCount: messages.length,
            separatorBuilder: (_, _) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final message = messages[index];
              final fromName = message.from.values.isNotEmpty
                  ? message.from.values.first
                  : "Nieznany nadawca";

              return ListTile(
                title: Text(
                  fromName,
                  style: TextStyle(
                    fontWeight: message.seen
                        ? FontWeight.normal
                        : FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  message.intro.isNotEmpty ? message.intro : message.text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: message.hasAttachments
                    ? const Icon(Icons.attachment, size: 18)
                    : null,
                onTap: () {
                  context.go("/messageDetails/${message.id}");
                },
              );
            },
          );
        },
      ),
    );
  }
}
