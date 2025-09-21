import 'package:flutter/material.dart';
import 'package:playground_bloc/core/route/route_constants.dart';
import 'package:playground_bloc/features/reimbursment/presentation/screens/reimbursment_screen.dart';
import 'package:playground_bloc/features/todo/presentation/screens/todo_list_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteConstants.todo:
        return MaterialPageRoute(builder: (_) => TodoListScreen());
      case RouteConstants.reimburstment:
        return MaterialPageRoute(builder: (_) => const ReimbursmentScreen());
      default:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Center(child: Text("Something wrong")),
        );
    }
  }
}
