import 'package:playground_bloc/core/di/main_di.dart';
import 'package:playground_bloc/features/reimbursment/data/datasources/reimbursment_remote_data_source.dart';
import 'package:playground_bloc/features/reimbursment/domain/usecases/get_bosses_use_case.dart';
import 'package:playground_bloc/features/reimbursment/domain/usecases/get_types_use_case.dart';
import 'package:playground_bloc/features/reimbursment/presentation/bloc/reimbursment/reimbursment_bloc.dart';

import '../data/repositories/reimbursment_repository_impl.dart';
import '../domain/repositories/reimbursment_repository.dart';
import '../presentation/bloc/bosses/bosses_bloc.dart';
import '../presentation/bloc/types/types_bloc.dart';

class ReimbursmentDi extends IconfigureDependencies {
  @override
  inject() {
    injectDataSource();
    injectRepository();
    injectUseCase();
    injectBloc();
  }

  @override
  injectBloc() {
    sl.registerFactory(() => TypesBloc(getTypes: sl()));
    sl.registerFactory(() => BossesBloc(getBosses: sl()));
    sl.registerFactory(() => ReimbursmentBloc());
  }

  @override
  injectDataSource() {
    sl.registerLazySingleton<ReimbursmentRemoteDataSource>(
      () => ReimbursmentRemoteDataSourceImpl(),
    );
  }

  @override
  injectRepository() {
    sl.registerLazySingleton<ReimbursmentRepository>(
      () => ReimbursmentRepositoryImpl(sl()),
    );
  }

  @override
  injectUseCase() {
    sl.registerLazySingleton<GetTypesUsecase>(() => GetTypesUsecase(sl()));
    sl.registerLazySingleton<GetBossesUsecase>(() => GetBossesUsecase(sl()));
  }
}
