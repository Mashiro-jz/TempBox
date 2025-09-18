// lib\presentation\pages\settings\settings_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:temp_box/core/widgets/app_drawer.dart';
import 'package:temp_box/core/widgets/theme_toggle_button.dart';
import '../../providers/auth_provider.dart';
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
      return const Scaffold(
        body: Center(child: Text("Brak zalogowanego konta.")),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ustawienia"),
        actions: const [ThemeToggleButton()],
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Adres e-mail",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 8),
              Text(
                account.account.address,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Hasło", style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      setState(() => _showPassword = !_showPassword);
                    },
                    child: Center(
                      child: Text(
                        _showPassword ? account.password : "••••••••",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isDeleting ? null : _deleteAccount,
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
      ),
    );
  }

  Future<void> _deleteAccount() async {
    final accountRepo = ref.read(accountRepositoryProvider);
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Usuń konto"),
        content: const Text(
          "Czy na pewno chcesz usunąć swoje konto? Tej operacji nie można cofnąć.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text("Anuluj"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text("Usuń"),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    setState(() => _isDeleting = true);

    try {
      final account = ref.read(accountRepositoryProvider).currentUser!;
      await accountRepo.deleteAccount(account.account.id);
      if (!mounted) return;
      context.go(RouteNames.auth);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Błąd przy usuwaniu konta: $e")));
    } finally {
      if (mounted) setState(() => _isDeleting = false);
    }
  }
}
