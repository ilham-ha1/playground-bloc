import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "package:flutter_web_plugins/flutter_web_plugins.dart";
import 'package:playground_bloc/core/di/main_di.dart';
import 'package:playground_bloc/core/route/routes.dart';
import 'package:playground_bloc/utils/services/navigation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    // No server rewrite needed
    setUrlStrategy(PathUrlStrategy()); // ✅ keeps route after refresh
  }

  // Try to restore last path BEFORE runApp
  // final lastPath = await RoutePersistence.load();

  // If a URL is already present (e.g., user deep-linked), prefer that.
  // final hasBrowserUrl = Uri.base.path.isNotEmpty && Uri.base.path != '/';

  // if (!hasBrowserUrl &&
  //     lastPath != null &&
  //     lastPath.isNotEmpty &&
  //     lastPath != '/') {
  //   // Jump initial location to the stored one
  //   appRouter.go(lastPath);
  // }

  await configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Keep your NavigationService working with go_router
    NavigationService.navigatorKey = rootNavigatorKey;

    return MaterialApp.router(
      title: 'Todo List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
        cardTheme: const CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 4,
        ),
      ),
      routerConfig: appRouter,
    );
  }
}
