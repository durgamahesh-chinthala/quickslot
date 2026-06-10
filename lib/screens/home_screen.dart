import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'venues_screen.dart';
import 'bookings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthProvider>().currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Hi, ${user?.name}!'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => context.read<AuthProvider>().logout(),
          ),
        ],
      ),
      body: [
        const VenuesScreen(),
        const BookingsScreen(),
      ][_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Venues'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'My Bookings'),
        ],
      ),
    );
  }
}
