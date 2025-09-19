// lib\core\widgets\app_drawer.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../presentation/pages/routing/app_router.dart';
import '../../presentation/providers/auth_provider.dart';

class AppDrawer extends ConsumerStatefulWidget {
  const AppDrawer({super.key});

  @override
  ConsumerState<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends ConsumerState<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          // 🔥 Nowoczesny DrawerHeader
          Container(
            height: 180,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF6D5DF6),
                  Color(0xFF8E54E9),
                  Color(0xFF4776E6),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Glassmorphism efekt
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                  child: Container(color: Colors.black.withValues(alpha: 0)),
                ),
                // Avatar + email
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 36,
                        backgroundColor: Colors.white.withValues(alpha: 0.2),
                        child: const Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "TempBox",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              authState.user?.address ?? "Nieznany użytkownik",
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 🔥 Nowoczesne ListTile
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                _buildDrawerItem(
                  context,
                  icon: Icons.mail_rounded,
                  label: "Wiadomości",
                  onTap: () => context.go(RouteNames.mailBox),
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.settings_rounded,
                  label: "Ustawienia",
                  onTap: () => context.go(RouteNames.settings),
                ),
                const Divider(),
                _buildDrawerItem(
                  context,
                  icon: Icons.logout_rounded,
                  label: "Wyloguj się",
                  color: Colors.redAccent,
                  onTap: () async {
                    final currentContext = context;
                    final shouldLogout = await showDialog<bool>(
                      context: currentContext,
                      builder: (ctx) => AlertDialog(
                        title: const Text("Wylogowanie"),
                        content: const Text(
                          "Czy na pewno chcesz się wylogować?",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(ctx, false),
                            child: const Text("Nie"),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                            ),
                            onPressed: () => Navigator.pop(ctx, true),
                            child: const Text("Tak"),
                          ),
                        ],
                      ),
                    );

                    if (!mounted) return;

                    if (shouldLogout == true) {
                      ref.read(authProvider.notifier).logout();
                      if (!mounted) return;
                      // ignore: use_build_context_synchronously
                      currentContext.go(RouteNames.login);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color? color,
  }) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: (color ?? Theme.of(context).colorScheme.primary)
            .withValues(alpha: 0.1),
        child: Icon(
          icon,
          color: color ?? Theme.of(context).colorScheme.primary,
        ),
      ),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: color ?? Theme.of(context).colorScheme.onSurface,
        ),
      ),
      onTap: onTap,
    );
  }
}
