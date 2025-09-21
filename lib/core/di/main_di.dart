import 'package:get_it/get_it.dart';
import 'package:playground_bloc/features/todo/di/todo_di.dart';

final sl = GetIt.instance;

abstract class IconfigureDependencies {
  inject();

  injectDataSource();

  injectRepository();

  injectBloc();

  injectUseCase();
}

Future configureDependencies() async {
  TodoDi().inject();
}
