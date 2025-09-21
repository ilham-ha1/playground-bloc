import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground_bloc/features/reimbursment/domain/usecases/get_bosses_use_case.dart';
import 'package:playground_bloc/features/reimbursment/presentation/bloc/bosses/bosses_event.dart';
import 'package:playground_bloc/features/reimbursment/presentation/bloc/bosses/bosses_state.dart';

class BossesBloc extends Bloc<BossesEvent, BossesState> {
  final GetBossesUsecase getBosses;

  BossesBloc({required this.getBosses}) : super(BossesInitial()) {
    on<LoadBosses>(_loadBosses);
  }

  Future<void> _loadBosses(LoadBosses event, Emitter<BossesState> emit) async {
    emit(BossesLoading());

    final result = await getBosses();
    result.fold(
      (failure) => emit(BossesError(failure)),
      (bosses) => emit(BossesLoaded(bosses)),
    );
  }
}
