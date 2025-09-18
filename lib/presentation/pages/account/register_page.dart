// lib/presentation/pages/register_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:temp_box/core/widgets/loading_indicator.dart';
import 'package:temp_box/core/widgets/theme_toggle_button.dart';
import 'package:temp_box/presentation/providers/auth_provider.dart';
import '../routing/app_router.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  String? _nameError;
  String? _passwordError;
  String? _registerError;

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    final name = _nameController.text.trim();
    final password = _passwordController.text.trim();

    setState(() {
      _nameError = name.isEmpty ? "Nazwa nie może być pusta" : null;
      _passwordError = password.isEmpty ? "Hasło nie może być puste" : null;
      _registerError = null;
    });

    if (_nameError != null || _passwordError != null) return;

    setState(() => _isLoading = true);

    try {
      // Wywołujemy logikę rejestracji przez authProvider
      final domains = await ref
          .read(accountRepositoryProvider)
          .getAvailableDomains();
      final domain = domains.first.domain;

      await ref
          .read(authProvider.notifier)
          .register(username: name, password: password, domain: domain);

      if (mounted) {
        // Pokaż adres w snackbarze
        final user = ref.read(authProvider).user;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Zarejestrowano! Twój email to: ${user?.address ?? ''}\n"
              "Możesz go zobaczyć w ustawieniach.",
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );

        context.go(RouteNames.mailBox);
      }
    } catch (e) {
      setState(() => _registerError = "Rejestracja nie powiodła się: $e");
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: LoadingIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => context.go(RouteNames.auth)),
        title: const Text("Rejestracja"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),

              Text(
                "Mail Client",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Utwórz nowe konto",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 40),

              // Nazwa konta
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Nazwa konta",
                  errorText: _nameError,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Hasło
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Hasło",
                  errorText: _passwordError,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              if (_registerError != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    _registerError!,
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),

              // Przycisk rejestracji
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Zarejestruj się"),
                ),
              ),
              const SizedBox(height: 16),

              const ThemeToggleButton(),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
