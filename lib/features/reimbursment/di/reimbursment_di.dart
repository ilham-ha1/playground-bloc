import 'package:playground_bloc/core/di/main_di.dart';

import '../data/repositories/reimbursment_repository_impl.dart';
import '../domain/repositories/reimbursment_repository.dart';
import '../presentation/bloc/reimbursment_bloc.dart';

class ReimbursmentDi extends IconfigureDependencies {
  @override
  inject() {
    injectBloc();
    injectDataSource();
    injectRepository();
    injectUseCase();
  }

  @override
  injectBloc() {
    sl.registerFactory(() => ReimbursmentBloc());
  }

  @override
  injectDataSource() {}

  @override
  injectRepository() {
    sl.registerLazySingleton<ReimbursmentRepository>(
      () => ReimbursmentRepositoryImpl(),
    );
  }

  @override
  injectUseCase() {}
}
