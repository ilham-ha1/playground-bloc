import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground_bloc/core/di/main_di.dart';
import 'package:playground_bloc/core/route/route_constants.dart';
import 'package:playground_bloc/features/reimbursment/presentation/bloc/bosses/bosses_bloc.dart';
import 'package:playground_bloc/features/reimbursment/presentation/bloc/types/types_bloc.dart';
import 'package:playground_bloc/features/reimbursment/presentation/screens/reimbursment_screen.dart';
import 'package:playground_bloc/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:playground_bloc/features/todo/presentation/screens/todo_list_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteConstants.todo:
        return MaterialPageRoute(
          settings: routeSettings,
          builder:
              (_) => BlocProvider(
                create: (_) => sl<TodoBloc>(),
                child: const TodoListScreen(),
              ),
        );
      case RouteConstants.reimburstment:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<TypesBloc>(create: (_) => sl<TypesBloc>()),
              BlocProvider<BossesBloc>(create: (_) => sl<BossesBloc>()),
            ],
            child: const ReimbursmentScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Center(child: Text("Something wrong")),
        );
    }
  }
}
