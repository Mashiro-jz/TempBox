// lib/presentation/pages/login_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:temp_box/core/widgets/error_card.dart';
import 'package:temp_box/core/widgets/loading_indicator.dart';
import 'package:temp_box/core/widgets/theme_toggle_button.dart';
import 'package:temp_box/presentation/providers/auth_provider.dart';
import '../routing/app_router.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;
  String? _nameError;
  String? _passwordError;

  @override
  void dispose() {
    _addressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    setState(() {
      _nameError = null;
      _passwordError = null;
      _errorMessage = null;
    });

    final address = _addressController.text.trim();
    final password = _passwordController.text.trim();

    bool hasError = false;

    if (address.isEmpty) {
      _nameError = "Adres email nie może być pusty";
      hasError = true;
    } else if (!RegExp(r"^[\w.-]+@[\w.-]+\.[a-zA-Z]{2,}$").hasMatch(address)) {
      _nameError = "Niepoprawny format adresu email";
      hasError = true;
    }

    if (password.isEmpty) {
      _passwordError = "Hasło nie może być puste";
      hasError = true;
    }

    if (hasError) {
      setState(() {});
      return;
    }

    setState(() => _isLoading = true);

    try {
      // Wywołanie przez authProvider, nie bezpośrednio repozytorium
      await ref
          .read(authProvider.notifier)
          .login(address: address, password: password);

      // Teraz authProvider.user != null -> GoRouterNotifier zareaguje
    } catch (e) {
      setState(() {
        _errorMessage = "Logowanie nie powiodło się: $e";
      });
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
        title: const Text("Mail Client Login"),
        leading: BackButton(onPressed: () => context.go(RouteNames.auth)),
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
                "Zaloguj się, aby kontynuować",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 40),

              // Nazwa konta
              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  hintText: "Nazwa konta",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  errorText: _nameError, // pokazujemy walidację
                ),
              ),
              const SizedBox(height: 16),

              // Hasło
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Hasło",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  errorText: _passwordError, // pokazujemy walidację
                ),
              ),
              const SizedBox(height: 24),

              // Przycisk logowania
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Zaloguj się"),
                ),
              ),
              const SizedBox(height: 16),

              // Błędy z repozytorium / serwera
              if (_errorMessage != null)
                ErrorCard(
                  message: _errorMessage!,
                  onRetry: () => setState(() => _errorMessage = null),
                ),

              const ThemeToggleButton(),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
