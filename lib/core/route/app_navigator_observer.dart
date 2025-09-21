import 'package:flutter/material.dart';

final appNavigatorObserver = AppNavigatorObserver();

class AppNavigatorObserver extends NavigatorObserver {
  String? currentRouteName;

  @override
  void didPush(Route route, Route? previousRoute) {
    currentRouteName = route.settings.name;
    debugPrint('Route - Push ${route.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    currentRouteName = previousRoute?.settings.name;
    debugPrint('Route - Pop ${route.settings.name}');
  }
}
