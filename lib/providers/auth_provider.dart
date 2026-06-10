import 'package:flutter/material.dart';
import '../models/user.dart';

// Hardcoded users for demo
final List<Map<String, String>> demoUsers = [
  {'id': 'user1', 'name': 'Alice'},
  {'id': 'user2', 'name': 'Bob'},
  {'id': 'user3', 'name': 'Charlie'},
];

class AuthProvider extends ChangeNotifier {
  User? _currentUser;

  User? get currentUser => _currentUser;

  void login(String userId) {
    final user = demoUsers.firstWhere((u) => u['id'] == userId);
    _currentUser = User(id: user['id']!, name: user['name']!);
    notifyListeners();
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }

  List<Map<String, String>> getAvailableUsers() => demoUsers;
}
