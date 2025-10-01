// route_persistence.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RoutePersistence extends NavigatorObserver {
  static const _kLastPath = 'last_path';

  static Future<void> save(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kLastPath, path);
  }

  static Future<String?> load() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kLastPath);
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _saveIfNamed(route);
    super.didPush(route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (newRoute != null) _saveIfNamed(newRoute);
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  void _saveIfNamed(Route<dynamic> route) {
    final settings = route.settings;
    final name = settings.name; // e.g. '/photo'
    if (name != null && name.isNotEmpty) {
      // Store the path (or name → your choice)
      RoutePersistence.save(name);
    }
  }
}
