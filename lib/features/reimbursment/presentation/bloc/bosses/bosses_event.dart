import 'package:equatable/equatable.dart';

abstract class BossesEvent extends Equatable {
  const BossesEvent();

  @override
  List<Object?> get props => [];
}

class LoadBosses extends BossesEvent {}
