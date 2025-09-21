import 'package:playground_bloc/core/di/main_di.dart';

import '../data/datasources/database_helper.dart';
import '../data/repositories/todo_repository_impl.dart';
import '../domain/repositories/todo_repository.dart';
import '../domain/usecases/create_todo.dart';
import '../domain/usecases/delete_todo.dart';
import '../domain/usecases/get_all_todos.dart';
import '../domain/usecases/toggle_todo_completion.dart';
import '../domain/usecases/update_todo.dart';
import '../presentation/bloc/todo_bloc.dart';

class TodoDi extends IconfigureDependencies {
  @override
  inject() {
    injectBloc();
    injectDataSource();
    injectRepository();
    injectUseCase();
  }

  @override
  injectBloc() {
    sl.registerFactory(
      () => TodoBloc(
        getAllTodos: sl(),
        createTodo: sl(),
        updateTodo: sl(),
        deleteTodo: sl(),
        toggleTodoCompletion: sl(),
      ),
    );
  }

  @override
  injectDataSource() {
    // External dependencies
    sl.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  }

  @override
  injectRepository() {
    // Repository
    sl.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl(sl()));
  }

  @override
  injectUseCase() {
    // Use cases
    sl.registerLazySingleton(() => GetAllTodos(sl()));
    sl.registerLazySingleton(() => CreateTodo(sl()));
    sl.registerLazySingleton(() => UpdateTodo(sl()));
    sl.registerLazySingleton(() => DeleteTodo(sl()));
    sl.registerLazySingleton(() => ToggleTodoCompletion(sl()));
  }
}
