// lib/presentation/pages/mailbox_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:temp_box/core/theme/app_palette.dart';
import 'package:temp_box/core/widgets/app_drawer.dart';
import 'package:temp_box/core/widgets/error_card.dart';
import 'package:temp_box/core/widgets/loading_indicator.dart';
import 'package:temp_box/core/widgets/theme_toggle_button.dart';
import 'package:temp_box/domain/entities/message_entity.dart';
import 'package:temp_box/presentation/providers/message_repository_provider.dart';
import 'package:temp_box/presentation/providers/theme_provider.dart';

class MailboxPage extends ConsumerWidget {
  const MailboxPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageRepo = ref.watch(messageRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("TempBox"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: "Odśwież",
            onPressed: () {
              // ignore: unused_result
              ref.refresh(messageRepositoryProvider);
            },
          ),
          const ThemeToggleButton(),
        ],
      ),
      drawer: const AppDrawer(),
      body: Consumer(
        builder: (context, ref, _) {
          final themeMode = ref.watch(themeControllerProvider);

          return StreamBuilder<List<MessageEntity>>(
            stream: messageRepo.allMessages(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: LoadingIndicator());
              }

              if (snapshot.hasError) {
                return ErrorCard(
                  message: "Nie udało się pobrać wiadomości: ${snapshot.error}",
                  onRetry: () => ref.refresh(messageRepositoryProvider),
                );
              }

              final messages = snapshot.data;

              if (messages == null || messages.isEmpty) {
                return const Center(child: Text("Brak wiadomości"));
              }

              final isDark = themeMode == ThemeMode.dark;

              final primaryTextColor = isDark
                  ? AppPalette.dark.onSurface
                  : AppPalette.light.onSurface;
              final secondaryTextColor = isDark
                  ? AppPalette.dark.onSurfaceVariant
                  : AppPalette.light.onSurfaceVariant;

              return ListView.separated(
                padding: const EdgeInsets.all(12),
                itemCount: messages.length,
                separatorBuilder: (_, _) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final message = messages[index];
                  final fromName = message.from.values.isNotEmpty
                      ? message.from.values.first
                      : "Nieznany nadawca";

                  return Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          context.go("/messageDetails/${message.id}");
                        },
                        child: Dismissible(
                          key: ValueKey(message.id),
                          direction:
                              DismissDirection.startToEnd, // tylko w prawo
                          onDismissed: (direction) async {
                            await ref
                                .read(messageRepositoryProvider)
                                .deleteMessage(message.id);
                            // ignore: unused_result
                          },
                          background: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 16,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 24,
                                    backgroundColor: message.seen
                                        ? Colors.grey[300]
                                        : AppPalette.primary.main,
                                    child: Text(
                                      fromName.isNotEmpty
                                          ? fromName[0].toUpperCase()
                                          : "?",
                                      style: TextStyle(
                                        color: message.seen
                                            ? Colors.black54
                                            : Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          fromName,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: primaryTextColor,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          message.subject.isNotEmpty
                                              ? message.subject
                                              : "(Brak tematu)",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: primaryTextColor,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          message.intro.isNotEmpty
                                              ? message.intro
                                              : message.text,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: secondaryTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (message.hasAttachments)
                                    const Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Icon(Icons.attachment, size: 20),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
