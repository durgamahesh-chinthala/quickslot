import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/venue_provider.dart';
import 'providers/booking_provider.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'theme.dart';
import 'core/network/services/base_api_service.dart';

// Set runtime flavor for API base URL selection
String? flavorType = 'DEV';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BaseApiService.initializeBaseUrl();
  runApp(const QuickSlotApp());
}

class QuickSlotApp extends StatelessWidget {
  const QuickSlotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => VenueProvider()),
        ChangeNotifierProvider(create: (_) => BookingProvider()),
      ],
      child: MaterialApp(
        title: 'QuickSlot',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.kLightTheme(),
        home: Consumer<AuthProvider>(
          builder: (context, authProvider, _) {
            return authProvider.currentUser == null
                ? const LoginScreen()
                : const HomeScreen();
          },
        ),
      ),
    );
  }
}
