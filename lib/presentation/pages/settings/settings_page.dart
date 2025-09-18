// lib\presentation\pages\settings\settings_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:temp_box/presentation/providers/auth_provider.dart';
import '../routing/app_router.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  bool _isDeleting = false;
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    final accountRepo = ref.watch(accountRepositoryProvider);
    final account = accountRepo.currentUser;

    if (account == null) {
      return Scaffold(body: Center(child: Text("Brak zalogowanego konta.")));
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Adres e-mail", style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 8),
            Text(account.account.address, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),

            Text("Hasło", style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _showPassword ? account.password : "••••••••",
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    _showPassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() => _showPassword = !_showPassword);
                  },
                ),
              ],
            ),
            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isDeleting
                    ? null
                    : () async {
                        final confirm = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Usuń konto"),
                            content: const Text(
                              "Czy na pewno chcesz usunąć swoje konto? Tej operacji nie można cofnąć.",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text("Anuluj"),
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const Text("Usuń"),
                              ),
                            ],
                          ),
                        );

                        if (confirm != true) return;

                        setState(() => _isDeleting = true);

                        try {
                          await accountRepo.deleteAccount(account.account.id);
                          if (!mounted) return;
                          // Po usunięciu konta wracamy do logowania
                          context.go(RouteNames.login);
                        } catch (e) {
                          if (!mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Błąd przy usuwaniu konta: $e"),
                            ),
                          );
                        } finally {
                          if (mounted) setState(() => _isDeleting = false);
                        }
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: _isDeleting
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text("Usuń konto"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
