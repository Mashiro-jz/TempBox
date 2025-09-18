// lib\core\widgets\app_drawer.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/pages/routing/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../presentation/providers/auth_provider.dart';

class AppDrawer extends ConsumerStatefulWidget {
  const AppDrawer({super.key});

  @override
  ConsumerState<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends ConsumerState<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.purpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Text(
                "TempBox",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.mail),
                  title: const Text("Wiadomości"),
                  onTap: () => context.go(RouteNames.mailBox),
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Ustawienia"),
                  onTap: () => context.go(RouteNames.settings),
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text("Wyloguj się"),
                  onTap: () async {
                    // Zapisujemy context w lokalnej zmiennej
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
                            onPressed: () => Navigator.pop(ctx, true),
                            child: const Text("Tak"),
                          ),
                        ],
                      ),
                    );

                    if (!mounted) return;

                    if (shouldLogout == true) {
                      ref.read(authProvider.notifier).logout();

                      // używamy context tylko jeśli widget nadal jest zamontowany
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
}
