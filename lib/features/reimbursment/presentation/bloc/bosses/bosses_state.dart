import 'package:equatable/equatable.dart';
import 'package:playground_bloc/features/reimbursment/domain/entities/bosses/bosses_entity.dart';

abstract class BossesState extends Equatable {
  const BossesState();

  @override
  List<Object?> get props => [];
}

//HIT ENDPOINT GET REIMBURSTMENT TYPE
class BossesInitial extends BossesState {}

class BossesLoading extends BossesState {}

class BossesLoaded extends BossesState {
  final List<BossesEntity> bosses;

  const BossesLoaded(this.bosses);

  @override
  List<Object?> get props => [bosses];
}

class BossesError extends BossesState {
  final String message;

  const BossesError(this.message);

  @override
  List<Object?> get props => [message];
}

class BossesSuccess extends BossesState {
  final String message;

  const BossesSuccess(this.message);

  @override
  List<Object?> get props => [message];
}
