import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:playground_bloc/features/questionere/di/questionere_di.dart';
import 'package:playground_bloc/features/reimbursment/di/reimbursment_di.dart';
import 'package:playground_bloc/features/todo/di/todo_di.dart';

final sl = GetIt.instance;
// helper to get any bloc globally (like Get.find<T>())
T getBloc<T extends BlocBase>() => sl<T>();

abstract class IconfigureDependencies {
  inject();

  injectDataSource();

  injectRepository();

  injectBloc();

  injectUseCase();
}

Future configureDependencies() async {
  TodoDi().inject();
  ReimbursmentDi().inject();
  QuestionereDi().inject();
}
