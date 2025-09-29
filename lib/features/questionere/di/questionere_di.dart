import 'package:playground_bloc/core/di/main_di.dart';
import 'package:playground_bloc/features/questionere/presentation/bloc/questionere/questionere_bloc.dart';
import 'package:playground_bloc/features/questionere/presentation/bloc/take_pic/take_pic_bloc.dart';

class QuestionereDi extends IconfigureDependencies {
  @override
  inject() {
    injectDataSource();
    injectRepository();
    injectUseCase();
    injectBloc();
  }

  @override
  injectBloc() {
    sl.registerFactory(() => QuestionereBloc());
    sl.registerFactory(() => TakePicBloc());
  }

  @override
  injectDataSource() {}

  @override
  injectRepository() {}

  @override
  injectUseCase() {}
}
