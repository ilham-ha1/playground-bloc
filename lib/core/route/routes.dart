// app_router.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:history/history_screen.dart';
import 'package:playground_bloc/core/di/main_di.dart';
import 'package:playground_bloc/core/route/app_navigator_observer.dart'; // routeObserver, appNavigatorObserver
import 'package:playground_bloc/core/route/route_aware_analytics.dart';
import 'package:playground_bloc/core/route/route_constants.dart';
import 'package:playground_bloc/core/route/route_persistance.dart';
import 'package:playground_bloc/features/questionere/presentation/bloc/questionere/questionere_bloc.dart';
import 'package:playground_bloc/features/questionere/presentation/bloc/take_pic/take_pic_bloc.dart';
import 'package:playground_bloc/features/questionere/presentation/screens/questionere_screen.dart';
import 'package:playground_bloc/features/questionere/presentation/screens/take_pic_screen.dart';
import 'package:playground_bloc/features/reimbursment/presentation/bloc/reimbursment/reimbursment_bloc.dart';
import 'package:playground_bloc/features/reimbursment/presentation/screens/reimbursment_screen.dart';
import 'package:playground_bloc/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:playground_bloc/features/todo/presentation/screens/todo_list_screen.dart';

// Optional: reuse your NavigationService key with GoRouter.
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: RouteConstants.todoPath, // e.g. '/todo'
  observers: [routeObserver, appNavigatorObserver, RoutePersistence()],
  routes: [
    GoRoute(
      name: RouteConstants.todo,
      path: RouteConstants.todoPath, // '/todo'
      builder:
          (context, state) => BlocProvider(
            create: (_) => sl<TodoBloc>(),
            child: const TodoListScreen(),
          ),
    ),
    GoRoute(
      name: RouteConstants.reimburstment,
      path: RouteConstants.reimburstmentPath, // '/reimburstment'
      builder:
          (context, state) => BlocProvider(
            create: (_) => sl<ReimbursmentBloc>(),
            child: const ReimbursmentScreen(),
          ),
    ),
    GoRoute(
      name: RouteConstants.questionere,
      path: RouteConstants.questionerePath, // '/questionere'
      builder:
          (context, state) => BlocProvider(
            create: (_) => sl<QuestionereBloc>(),
            child: const QuestionereScreen(),
          ),
    ),
    GoRoute(
      name: RouteConstants.photo,
      path: RouteConstants.photoPath, // '/photo'
      builder: (context, state) {
        final qBlocArg =
            state.extra is QuestionereBloc
                ? state.extra as QuestionereBloc
                : null;

        return MultiBlocProvider(
          providers: [
            if (qBlocArg != null)
              BlocProvider<QuestionereBloc>.value(value: qBlocArg)
            else
              BlocProvider<QuestionereBloc>(
                create: (_) => sl<QuestionereBloc>(),
              ),

            BlocProvider<TakePicBloc>(create: (_) => sl<TakePicBloc>()),
          ],
          child: const TakePicScreen(),
        );
      },
    ),
    GoRoute(
      name: RouteConstants.history,
      path: RouteConstants.historyPath, // '/history'
      builder: (context, state) => HistoryScreen(items: mockItemsHistory()),
    ),
  ],
);
