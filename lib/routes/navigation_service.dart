import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic>? navigateTo(RouteSettings route) {
    return navigatorKey.currentState?.pushNamed(route.name ?? '/');
  }
}
