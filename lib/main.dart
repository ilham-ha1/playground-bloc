import 'package:flutter/material.dart';
import 'package:playground_bloc/core/di/main_di.dart';
import 'package:playground_bloc/core/route/app_navigator_observer.dart';
import 'package:playground_bloc/core/route/route_aware_analytics.dart';
import 'package:playground_bloc/core/route/route_constants.dart';
import 'package:playground_bloc/core/route/routes.dart';
import 'package:playground_bloc/utils/services/navigation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      initialRoute: RouteConstants.todo,
      onGenerateInitialRoutes: (String initialRouteName) {
        return [
          AppRouter().onGenerateRoute(RouteSettings(name: initialRouteName)),
        ];
      },
      onGenerateRoute: AppRouter().onGenerateRoute,
      navigatorKey: NavigationService.navigatorKey,
      navigatorObservers: [routeObserver, appNavigatorObserver],
    );
  }
}
