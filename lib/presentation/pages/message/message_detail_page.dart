// lib/presentation/pages/message_detail_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:temp_box/core/theme/app_palette.dart';
import 'package:temp_box/core/widgets/app_drawer.dart';
import 'package:temp_box/core/widgets/loading_indicator.dart';
import 'package:temp_box/core/widgets/theme_toggle_button.dart';
import 'package:temp_box/domain/entities/message_entity.dart';
import 'package:temp_box/presentation/pages/routing/app_router.dart';
import 'package:temp_box/presentation/providers/message_repository_provider.dart';
import 'package:temp_box/presentation/providers/theme_provider.dart';

class MessageDetailPage extends ConsumerWidget {
  final String messageId;

  const MessageDetailPage({super.key, required this.messageId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageRepo = ref.watch(messageRepositoryProvider);
    final themeMode = ref.watch(themeControllerProvider);

    final isDark = themeMode == ThemeMode.dark;
    final primaryTextColor = isDark
        ? AppPalette.dark.onSurface
        : AppPalette.light.onSurface;
    final secondaryTextColor = isDark
        ? AppPalette.dark.onSurfaceVariant
        : AppPalette.light.onSurfaceVariant;
    final backgroundColor = isDark
        ? AppPalette.dark.surface
        : AppPalette.light.surface;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Wiadomość"),
        leading: BackButton(onPressed: () => context.go(RouteNames.mailBox)),
        actions: [
          const ThemeToggleButton(),
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: "Usuń wiadomość",
            onPressed: () async {
              final themeMode = ref.read(themeControllerProvider);
              final isDark = themeMode == ThemeMode.dark;
              final textColor = isDark ? Colors.white : Colors.black;

              final shouldDelete = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: isDark
                      ? AppPalette.dark.surface
                      : AppPalette.light.surface,
                  title: Text(
                    "Usuń wiadomość",
                    style: TextStyle(color: textColor),
                  ),
                  content: Text(
                    "Czy na pewno chcesz usunąć tę wiadomość? Operacja jest nieodwracalna.",
                    style: TextStyle(color: textColor),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: Text("Nie", style: TextStyle(color: textColor)),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // czerwony przycisk
                      ),
                      onPressed: () => Navigator.pop(context, true),
                      child: Text("Tak", style: TextStyle(color: textColor)),
                    ),
                  ],
                ),
              );

              if (shouldDelete == true) {
                await ref
                    .read(messageRepositoryProvider)
                    .deleteMessage(messageId);
                // ignore: use_build_context_synchronously
                context.go(RouteNames.mailBox);
              }
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
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
                style: TextStyle(color: secondaryTextColor),
              ),
            );
          }

          final message = snapshot.data!;
          final fromName = message.from.values.isNotEmpty
              ? message.from.values.first
              : "Nieznany nadawca";

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 700),
                child: Container(
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message.subject.isNotEmpty
                            ? message.subject
                            : "(Brak tematu)",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: primaryTextColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppPalette.primary.main,
                            child: Text(
                              fromName.isNotEmpty
                                  ? fromName[0].toUpperCase()
                                  : "?",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              "Od: $fromName",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: secondaryTextColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 32, thickness: 1.2),
                      Text(
                        message.text.isNotEmpty
                            ? message.text
                            : "(Brak treści)",
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          color: primaryTextColor,
                        ),
                      ),
                      if (message.hasAttachments) ...[
                        const SizedBox(height: 20),
                        Row(
                          children: const [
                            Icon(Icons.attachment),
                            SizedBox(width: 8),
                            Text("Wiadomość zawiera załączniki"),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
