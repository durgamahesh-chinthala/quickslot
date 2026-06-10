import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../theme.dart';

import '../widgets/loading_indicator.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QuickSlot')),
      body: SafeArea(
        child: Center(
          child: Consumer<AuthProvider>(
            builder: (context, authProvider, _) {
              final users = authProvider.getAvailableUsers();
              if (users.isEmpty) return const LoadingIndicator();

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FlutterLogo(size: 84),
                  const SizedBox(height: 16),
                  const Text(
                    'Welcome to QuickSlot',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text('Select a demo user to continue', style: TextStyle(color: Colors.black54)),
                  const SizedBox(height: 24),
                  ...users.map((user) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.person),
                        onPressed: () => authProvider.login(user['id']!),
                        label: Text(user['name']!),
                        style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
                      ),
                    );
                  }).toList(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
